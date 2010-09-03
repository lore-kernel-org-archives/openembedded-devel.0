Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrT51-0003Rg-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 12:01:58 +0200
Received: by wwi14 with SMTP id 14so141467wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6sNWvc+6EtEpILHq6XeAtjAcrBLGPBlS44eHRfqss8E=;
	b=aA3ziM5fWLxKy+hBTs+WKXAnggzGsjXEXSLzIc2r3MIPDMPBpbmyvG422cnTAMTEAh
	FAe2X8oRvfyfRy9CPeTvzGligODUbXH9vsk5c8mB3RYhw+dx+AFQGhSjF2EB0mqXEQgY
	2I4HPH/1ILFfLwz5UpuGRIykRayaz71n8OAWA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ji5hNy8mIWzx+E/qW57vVgpO1xRQk8j/Y8jtX5IMfkqFZyI79i4wFjUf08JAmBPjjX
	TU/D8GKl5/AuFo4C5XSMa56KbVGOkJ+KjYHZDzWpOJx+gzwfwuKYP6pd9i5cvSaG4Vts
	+q9dNT5gfc0wYPTw4BlERVUHk6Rxzk4NqdeRU=
MIME-Version: 1.0
Received: by 10.227.27.214 with SMTP id j22mr451579wbc.72.1283508031349; Fri,
	03 Sep 2010 03:00:31 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Fri, 3 Sep 2010 03:00:31 -0700 (PDT)
In-Reply-To: <201009031046.30672.schnitzeltony@gmx.de>
References: <201009031046.30672.schnitzeltony@gmx.de>
Date: Fri, 3 Sep 2010 03:00:31 -0700
Message-ID: <AANLkTinMDG_3C+2hEwDcpSfVhtF8bnkTeqPUPv2Re9mY@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp_2.6.32.bb fails at do_compileconfigs
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
X-List-Received-Date: Fri, 03 Sep 2010 10:02:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have been able to build mine on the last 2 commits though other
issues cause my image to not finish. Have you tried deleting the
source file and having it fetch it again? That would be the only thing
I can think of other than maybe something isnt right in the build
system

On Fri, Sep 3, 2010 at 1:46 AM, Andreas Mueller <schnitzeltony@gmx.de> wrot=
e:
> I have
>
> * pulled last night 261676fed0818a60a6f5b4dc781235cc6c49ba86
> * deleted tmp dir for fresh build
> * tried baking single packages (round the clutter stuff I posted)
>
> Now I get
>
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/Superandi/OpenEmbedded/gumstix-oe/recipes/linux/lin=
ux-omap-psp_2.6.32.bb do_compileconfigs failed
> ERROR: Function do_compileconfigs failed
> NOTE: Task failed: ('function do_compileconfigs
> failed', '/home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnue=
abi/linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/=
temp/log.do_compileconfigs.12972')
> ERROR: Logfile of failure stored
> in: /home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-linux-gnueabi/li=
nux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869/temp/l=
og.do_compileconfigs.12972
> Log data follows:
> | Multiple configs found, building those first
> | cp: cannot stat `/home/Superandi/OpenEmbedded/tmp/work/overo-angstrom-l=
inux-gnueabi/linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc=
004d7869/configs/*': No such
> file or directory
> | ERROR: Function do_compileconfigs failed
> NOTE: package linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dc=
bfc004d7869: task do_compileconfigs: Failed
>
> My last fresh build was based on
>
> 7ec84b10a33241350d53efe50b7ca31bdecb2204
> Date: =A0 Mon Aug 30 14:51:47 2010 -040
>
> I checked for changes within recipes/linux for changes during the time pe=
rioud and found nothing helpful for this issue.
>
> But I found several commits at base.bbclass. Is it possible that these ar=
e related to the problem?
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


