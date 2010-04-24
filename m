Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O5ifZ-0001CK-Jk
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 18:57:30 +0200
Received: by mail-qy0-f195.google.com with SMTP id 33so8912341qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=9WX+uim6bTsrKvK3CIlzeX5+PmofWsDWgGjX7ko4PrA=;
	b=I5JeIsjYa4P2kDbpInJCBG7RJRVij8dGum8q4REXJYEZIjRgSAy579GvD5TOjuAg+u
	yj5+M4mz4+iB0VSL68ScS2Tb54KbmMr6/PB9vrFCI96mf3A0nlLiZ3JPhPxHtqe/L/C2
	FXNVHT89UemAVLLHuFduAszyYy/HDYC+Xo7IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iHbqDeNWimSsICukX4//WkdVlEDmqLrryb8incXBVqzIW6mrpyXzJkRWYyZ6zL4hO+
	2raf9IjfI/+fIHlbkvFdf029/ON0OZp7GR/kXuM+71vYqq/OdsZ7uWMZT3y+9fBTCJha
	PhlwodAX6P4oAOuvk4ptWTDpW/u8dx30/cj34=
Received: by 10.229.217.14 with SMTP id hk14mr1932886qcb.89.1272128034111; 
	Sat, 24 Apr 2010 09:53:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Sat, 24 Apr 2010 09:53:34 -0700 (PDT)
In-Reply-To: <D09DC8C0-929F-4983-AB79-490641D85D3C@pilsoft.com>
References: <D09DC8C0-929F-4983-AB79-490641D85D3C@pilsoft.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 24 Apr 2010 09:53:34 -0700
X-Google-Sender-Auth: 9e918fa9e8c871b7
Message-ID: <l2qb6ebd0a51004240953le39e4f63r6731102e305b4dff@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: problem with modifications to base.bbclass
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
X-List-Received-Date: Sat, 24 Apr 2010 16:57:30 -0000
Content-Type: text/plain; charset=UTF-8

Fixed.  Sorry about that.

On Sat, Apr 24, 2010 at 2:25 AM, David Hemmo <david.oe@pilsoft.com> wrote:

> Hello,
>
> I am trying to build an image and I run in a python error that seems to be
> caused by the latest modifications to base.bbclase
>
> ERROR: Error in executing:
> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
> stagemanager-native_0.0.1.bb
> ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() got
> an unexpected keyword argument 'env'
> ERROR: Printing the environment of the function
> ERROR:  0030:                   destdir = os.path.join(workdir, *subdirs)
> ERROR:  0031:                   bb.mkdirhier(destdir)
> ERROR:  0032:           else:
> ERROR:  0033:                   destdir = workdir
> ERROR:  0034:           oe_unpack_file(local, destdir, env=env,
> **urldata.parm)
> ERROR:  0035:
> ERROR: Error in executing:
> /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
> stagemanager-native_0.0.1.bb
> ERROR: Exception:<type 'exceptions.TypeError'> Message:oe_unpack_file() got
> an unexpected keyword argument 'env'
> ERROR: Printing the environment of the function
> ERROR: Build of /home/owner/dvt/oe/oe_shogo2test/recipes/stage-manager/
> stagemanager-native_0.0.1.bb do_unpack failed
>
> it seems the parameters sent to oe_unpack_file are not what the function
> faits for
>
> def oe_unpack_file(file, data, url = None):
>
> I am too new to this project to propose a patch, but I hope someone will be
> able to help
>
> Thanks
>
> David Hemmo
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

