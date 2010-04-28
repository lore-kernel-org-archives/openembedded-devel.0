Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>)
	id 1O78XX-0001bw-IF; Wed, 28 Apr 2010 16:47:05 +0200
Received: by pwj5 with SMTP id 5so9290789pwj.6
	for <multiple recipients>; Wed, 28 Apr 2010 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=4ksnRbFkylzqd4LcxSEvaanv9oILFJhG1FUvWYMfcGI=;
	b=bCMHEuHAhPIei3ZscvqlfpmYmiVCYn9w5KvDU6ia7begfuWWs35/yW/Gy9V7h1A7aT
	h1t1gsoZ+SSzUwFF45Q86MCIf0KN+m/lDwmQytfkjD0tRl1rsmdEIuS6rYXpPcFqa9gv
	mASxeYqsSPyZP2K7ChDfKrZDcz5ommQHJmYkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=PdIknQE2girOLaSlJnHirVsIIittj5z1lAsEkBKys5eB10cRPFs+SsgM2cJQWFbCfv
	CRmO/vhaAgRZfA/lxpmJ7IXnxBcLhl3/M4RthGBzmv7VudeACASVFYa1QvFLCJcyZQw2
	ytfHHbZJrbHJQI4/OyqQZwk1AdBsfP0wsr/jI=
MIME-Version: 1.0
Received: by 10.141.188.4 with SMTP id q4mr1918303rvp.147.1272465769394; Wed, 
	28 Apr 2010 07:42:49 -0700 (PDT)
Received: by 10.150.144.11 with HTTP; Wed, 28 Apr 2010 07:42:49 -0700 (PDT)
In-Reply-To: <hr4t3j$tds$1@dough.gmane.org>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>
	<hr3im2$gf6$1@dough.gmane.org>
	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
	<hr4t3j$tds$1@dough.gmane.org>
Date: Wed, 28 Apr 2010 20:12:49 +0530
Message-ID: <k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@lists.openembedded.org
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Wed, 28 Apr 2010 14:47:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4/27/10, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-04-10 20:41, Abhishek Sharma wrote:
>
>> Thanks for the previous response. I did as suggested, but now the image
>> built gives this sort of an error.
>> kernel panic - not syncing: No init found. Try passing init= option to
>> kernel
>
>> I don't have a clue as to why this is happening, do i need to set
>> something
>> in my image-recipe or the app-recipe???
>
> Ehm, you specified that it shouldn't contain an init with:
>
> IMAGE_INIT_MANAGER = ""
> IMAGE_INITSCRIPTS = ""
>
> Why did you put those vars in if you to want /sbin/init to be there?!?!?
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL1fexMkyGM64RGpERAsfhAJ4kyXGOYi26QA5ZHS3YwFrFiwYsyQCfVpvU
> 8/R9tQh7NSUZKFe++FKN+r4=
> =7uwL
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>

It was silly of me to put INIT_SCRIPTS = "" without actually knowing about them.
Now I have changed the image file and it looks like:
require base-image.bb
IMAGE_INSTALL = "qtehelloworld"
IMAGE_BASENAME = "qtehelloworld"
RDEPENDS = "qte"
inherit image

Yet when I buils the image the same init error occurs. I am confused
as to why is that happening?? Since I have used [required
base-image.bb] so init parameters must be set automatically or do i
need to set them manually??
-- 
Abhishek Sharma


