Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OTdBJ-0000zt-W1
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 17:57:06 +0200
Received: by fxm12 with SMTP id 12so858479fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=WXrMb7LounNmqyerANr7y+31J5FZeFf5gXYUTEuDP8Y=;
	b=Ko+Mw9T7Hebgav5jJV5elSmwoxTxMQUfdHrY8Z84idnU8MSZ4WJAUfhZaevpzNM+ly
	9HHS+39126P4UdGnmTVr78nutODlqz8mbiYA74zJzG2UwZJipuXZNu8QcpFJmE+N6znJ
	RXORx9BoEZbc/mT3+TZR0C8OqmkgN9yzDQkNU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VSz55JtalX47H03WXT11Lb31bJxEWhBtRWM0deko9wUZ94RHhP5ZOSsFI8mseALCLc
	SvDAaWPl7XmFSdnuaYGvXnk/uhiSu73ZPh/ZqEXfMvOqo5Hps/yF/T6KqP3ZRFR5IL1A
	mkVMNOEPhzE+4tnwHFU9gqcZIXjEGXUDAVUww=
MIME-Version: 1.0
Received: by 10.239.188.209 with SMTP id q17mr481011hbh.52.1277826742937; Tue, 
	29 Jun 2010 08:52:22 -0700 (PDT)
Received: by 10.239.182.83 with HTTP; Tue, 29 Jun 2010 08:52:22 -0700 (PDT)
In-Reply-To: <01fb01cb179c$580068f0$08013ad0$@Distant-earth.com>
References: <alpine.DEB.2.00.1006291005050.10428@lynx>
	<01fb01cb179c$580068f0$08013ad0$@Distant-earth.com>
Date: Tue, 29 Jun 2010 08:52:22 -0700
Message-ID: <AANLkTilMht97znPOunP0dTBMwE6gPF1EyztWRC21MsXo@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: so ... what's the proper way to report a build failure?
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
X-List-Received-Date: Tue, 29 Jun 2010 15:57:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

The wiki link for me had nothing on it, I have been wondering the same
things myself.



On Tue, Jun 29, 2010 at 8:04 AM, John Willis
<John.Willis@distant-earth.com>wrote:

> Hi Robert,
>
> >   given that i like to keep up with the OE dev branch and test build a
> > beagleboard-demo-image as necessary, what is the *encouraged* way to
> > report a new build failure?  on the OE list?  on the angstrom list?
> > tinderbox?
> >
> >   after a "git pull" earlier this morning, "realpath-1.15" fails to
> build.
> what
> > should i do with the error diagnostics?
>
> Pretty sure this has been suggested in the past ;-)
> (
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02
> 876.html<http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02%0A876.html>)
> but I'll say again, setting up Tinderbox
> (http://tinderbox.openembedded.net/) has to be a pretty good starting
> place
> to collaborate on build issues.
>
> It's really easy to setup
> (
> http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
> failure_reports) and the classes will automatically deal with uploading of
> your fail logs/build info etc. so you can refer others to it (and for that
> matter, see if others are building the same packages without issue).
>
> Regards,
>
> John
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

