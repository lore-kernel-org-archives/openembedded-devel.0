Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OLzoO-0004iC-Tx
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:29:53 +0200
Received: by gxk19 with SMTP id 19so130383gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=KHq1FsWIpGznkQZvErB91Hg6DhGwRms67xPViOzpC/0=;
	b=iC0XqYQvGOsFnkjithmtcfgjznCQtj2U99iiEdAVyJ67buGoMbXrUdQxGIHUU2vQAn
	+2a1VHPj5h/fbmfnquMPeQEp3rYZkJWbDjcggU6GN3jH/+5vHYIpdnygwMDRoAANw0MX
	3W1EhxEiyGxwwSi4T52oobVSHFl44ADDisoV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=sTntRqCPBDukjBWaz/Rg/eblg0Y1TvuYrZrGY5t9p6pSD3GMDRa/x1C0oUQkmACGkU
	Ju+O8BWwC6HAIaXcTFtROMaC4JEem+TmNe8OMSIIPvPG92LtAyycPUp8MREO57EgGP+g
	nVPFZodgALXKBYHkq67kmaVvx9YIosPaYH7VU=
Received: by 10.224.26.154 with SMTP id e26mr1431062qac.247.1276007125873; 
	Tue, 08 Jun 2010 07:25:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Tue, 8 Jun 2010 07:25:02 -0700 (PDT)
In-Reply-To: <1275980325-23187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1275980325-23187-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Jun 2010 07:25:02 -0700
X-Google-Sender-Auth: GpfHJjnD0A-jhlYw8O4-noNkE34
Message-ID: <AANLkTim5KgqB_x1szeqTpRw4krnWN3J5KbB30sDMfTRz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] debian.bbclass: call objdump from binutils-cross
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
X-List-Received-Date: Tue, 08 Jun 2010 14:29:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 7, 2010 at 11:58 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * host objdump can support multiple targets and instead of output it shows
> list of targets to choose from
>  see
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/33294/focus=33357
> * for some reason cross/bin doesn't seem to be in PATH, that's why there
>  is full path
>

cross/bin is in the PATH *bitbake* variable, but not in the *environment*
exported to subprocesses.  I'd suggest either setting PATH in cmd, which
we've done in the past, or use the oe_popen/oe_system convenience functions,
which pull all exported bitbake vars into the environment used to spawn the
subprocess.

Ideally, it wouldn't be necessary -- perhaps we should think about having
bitbake's finalize() transfer the vars over into os.environ, or something...
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

