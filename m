Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RKCZv-0001rb-49
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 19:20:20 +0200
Received: by qyg14 with SMTP id 14so5975991qyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YL3Gkat25lEj6Mq97+DnANooxCbhivaH7jMSS3QGZ20=;
	b=Ya34Ld/0I6UspwSpT2qnIJzZmybzdf7b7GtcFgX8JGd3GVpNNoJBfhuFyRe0uAsw0u
	GALGDvaGeSI0F1kdEFcpJQUSvZvqrYB1c3gvwn1t2Zv03XLoeDeOOCXSFQL+SSNWu47O
	sJet8+tngT5J5OEFZttKaZf0MZ9NKmp7LTI+k=
MIME-Version: 1.0
Received: by 10.229.64.134 with SMTP id e6mr1283916qci.150.1319908451129; Sat,
	29 Oct 2011 10:14:11 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Sat, 29 Oct 2011 10:14:11 -0700 (PDT)
In-Reply-To: <4EAC296D.8040403@telia.com>
References: <4EAC296D.8040403@telia.com>
Date: Sat, 29 Oct 2011 10:14:11 -0700
Message-ID: <CA+M6bXnq6jfhyZ+6nRB3GDqoRv3oa=m-xcht8xrAYV_7aeVzkA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Adding sumtool to a JFFS2 build to speed up first boot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Oct 2011 17:20:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 29, 2011 at 9:27 AM, Ulf Samuelsson
<ulf_samuelsson@telia.com> wrote:
> Trying to solve another problem I came up with
> changing IMAGE_CMD_jffs2 defined in conf/bitbake.conf
> by redefining it in conf/local.conf.
>
> During that process I noticed the "sumtool" utility
> which works on the jffs2 image, doing some
> bookkeeping which then does not have to be
> done on the target.
>
> I unserstand, this can speed up loading significantly.
> Any reason not using this in OE?

Last time I looked at this, the reason was that you had to re-jigger
the IMAGE_CMD a bit and you also have to take care as not all of the
options are the same between mkfs.jffs2 and sumtool.  At least the
first part might be easier with oe-core and the reworked image class.
The latter part is just annoying.

-- 
Tom


