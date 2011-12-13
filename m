Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Rabw9-0006r3-BP
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:39:05 +0100
Received: by dake40 with SMTP id e40so161717dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kYZ20MT4q9/IY/pUqkF6cVqX23tPNf4AQzZI7GKRdHc=;
	b=up8IkaPar8R3v7G9yKYwX+EkoeYSsy30HRR3Pre3qZXGVjWrLjnc2Y1It198gypMOI
	cw3iPOgSuhc+tWnSN+/HNJBGJzexyUY5uYXoYiugMNpjlh5n2YFOt0weCJLaq4QcwVdg
	YJIQjEt7ptjtiyibzSW/S3KitMjegNXLZs8AU=
MIME-Version: 1.0
Received: by 10.68.122.231 with SMTP id lv7mr26327959pbb.45.1323819128353;
	Tue, 13 Dec 2011 15:32:08 -0800 (PST)
Received: by 10.68.196.196 with HTTP; Tue, 13 Dec 2011 15:32:08 -0800 (PST)
In-Reply-To: <1545212.W5z1uACr0M@helios>
References: <1323811550-876-1-git-send-email-dbaryshkov@gmail.com>
	<1545212.W5z1uACr0M@helios>
Date: Wed, 14 Dec 2011 03:32:08 +0400
Message-ID: <CALT56yNowfmEegV6OFQEdnk47YaaFOd9S_g0vdt3YKQf91DYHg@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] opie-bluetoothd: fix compilation issues
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
X-List-Received-Date: Tue, 13 Dec 2011 23:39:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 14, 2011 at 2:58 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 14 December 2011 01:25:50 Dmitry Eremin-Solenikov wrote:
>> rfkill.cpp uses symbols from libsysfs. However opie-bluetoothd recipe
>> lacks dependency on sysfsutils (package containing libsysfs) and project
>> file also lacks -lsysfs in the LIBS rule. Fix those issues.
>
> Rather than apply this patch I've merged the change upstream and updated the
> OPIE_SRCREV in meta-opie to f5c8bd6272b5bee393736f401232ce0ccc984fec (which
> includes a few other fixes as well.) Thanks!

Thanks! I just didn't want to touch SRCREV, so I provided oe patch instead :)

-- 
With best wishes
Dmitry


