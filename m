Received: from mail-bk0-f53.google.com ([209.85.214.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U6bsd-0000pk-Qa
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 08:08:23 +0100
Received: by mail-bk0-f53.google.com with SMTP id j10so1834033bkw.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 22:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=ttlpNA/dhwQPl2BQk+LvxVhGSn/qa18bHW2u51bpmG4=;
	b=RCZpwXv8B9JdX5Mg8NX+u2tHox2ZJ0ZqicrGaMREDv2hZnyown19czL7Xi+VC12NIw
	Mns9LJ5wh1PvyiPS3wKW/SevNLdVBV46pb4HW5ds65/qw1f9eVO+FtFwpGtK4iDXZNal
	kfxToTZDey3jLnmILsrdnLGc2nnmNmPSsyLeCkYjLkYJmLP7s9j4f1n+rXgeCl7v1Pqc
	OgTgjpAgk0aPlh1czQpAx8elejZgB8BOfhLikVapk7ivgor6+tP7OfcZMn3QFfQjoA2p
	LwS9PfbftfpAQmDJWFYn6u9K8y7uZf9B2Uht6xvZrTNewROL6gCEhJz3WU8K7Wn+nVaU
	DU0g==
X-Received: by 10.204.127.6 with SMTP id e6mr1703939bks.13.1360997531094; Fri,
	15 Feb 2013 22:52:11 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Fri, 15 Feb 2013 22:51:49 -0800 (PST)
In-Reply-To: <511E373D.1070109@nedap.com>
References: <511E373D.1070109@nedap.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Sat, 16 Feb 2013 15:51:49 +0900
X-Google-Sender-Auth: ov1_oztEaBAXqX_SFQO93oS1Ojs
Message-ID: <CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: opkg-make-index not found
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
X-List-Received-Date: Sat, 16 Feb 2013 07:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

> This is on a 64 debian machine, possibly the wrong path is searched?

If you doubt the PATH setting, you should check the output from:
$ bitbake -e | grep '^export PATH'

-- 
Takeshi Hamasaki

2013/2/15 Jaap de Jong <jaap.dejong@nedap.com>:
> Hi All,
>
> if I do
>
>     bitbake package-index
>
> it crashes with the message
>
>     | /bin/bash: opkg-make-index: command not found
>
> This is on a 64 debian machine, possibly the wrong path is searched?
> (there is a opkg-make-index under sysroots/x86_64-linux/usr/bin)
>
> Is this a known problem?
> Thanks!
>
> Jaap
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


