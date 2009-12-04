Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NGVFX-0003Ix-2N
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 11:18:58 +0100
Received: by fxm25 with SMTP id 25so2266429fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=EFqCVOsRFnb8oM09190sHPu54xIXKgnzECT1kjfnlvo=;
	b=upNv1YWcHPcS0vEURqtx9I0vQiRXxs7LLrbSDKNwgfibhJQ34xmXNnlQEdIPybtJlP
	ZATUZHOzK6oDqkTGYicpgfKnRtaCNE7TcLs/dDLksplQsl+liI6SGVxKhbCwAkoxjjqk
	In6RpPb6pBCkJhej4wYNK3z2aU6Oyz7yfve+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=EGtCV+STiZV30iqrePAloN1m916E1E+xdEMp4e/ZrPxkfN33K9pRA71XocUVUPKZjP
	2zQgsR84FHVtvZkw/gXolFGAZ9FAnAh5jMynYu2kgqrznswx2mTjfBYgAkogieetjQqS
	LBG4kuydu4x18s31pl7wH3PsXwh5ZypoJCgoM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.201 with SMTP id u9mr307492hbu.112.1259921838104; Fri, 
	04 Dec 2009 02:17:18 -0800 (PST)
In-Reply-To: <hfamji$7nr$1@ger.gmane.org>
References: <20091204090048.GA3233@jama> <hfamji$7nr$1@ger.gmane.org>
Date: Fri, 4 Dec 2009 08:17:18 -0200
X-Google-Sender-Auth: 8dde0ad5bbd86c45
Message-ID: <be7a9f3d0912040217x747ede28p78b38839ce6d74cc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] sane-providers.inc with default providers for all distributions
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
X-List-Received-Date: Fri, 04 Dec 2009 10:18:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, Dec 4, 2009 at 8:00 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 04-12-09 10:00, Martin Jansa wrote:
>>
>> I would like to create new file conf/distro/include/sane-providers.inc
>> where we could store all default providers.
>
> If it's the same for everyone, can't it be put in bitbake.conf? I'm growing
> a bit tired of mandatory sane-* files to include.

This makes much more sense to me.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


