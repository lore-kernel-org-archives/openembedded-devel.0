Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1LvmvN-0000zJ-9M
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 08:24:17 +0200
Received: by bwz19 with SMTP id 19so1714711bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 23:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=BH3nTqiPHgA+vlZER6YiIr3YwexP4NMap/a2qjyqExE=;
	b=PXnFveU4hjOwxWsoupEAqDD/c0WQd16AUZeqSdG8R8+7eWMx4UHHv8Nb7bRS0U2kZM
	C1vKYrZM4jddW6+oWMGxVyponbQrf9bUmiW/tqH/odhUvmNlIHxPXab08Yh6NqdP0G5i
	D+ptNyPMLTcyByiVYr2HHez+ITdRDGA/2P5T4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ECHgFujCzuWDCAtDZE+VG4nvKt4eGTNFRPlDnWbAwHlte9QyzuvPgAmL/GtW2TSelT
	vRzFEN5AqpKSU8mcCYGE3WX9GBQaErWr4+FdzFbBokvQXHZ/MllBLDSR8BhCDB8r8o1N
	d7+C44WYLGWlwpZzSTFksze78KZvXQ7fhxPnM=
MIME-Version: 1.0
Received: by 10.86.65.9 with SMTP id n9mr3735229fga.43.1240208394285; Sun, 19 
	Apr 2009 23:19:54 -0700 (PDT)
In-Reply-To: <49EB6F02.1030402@gmail.com>
References: <49EB6F02.1030402@gmail.com>
Date: Mon, 20 Apr 2009 08:19:54 +0200
Message-ID: <6978a1740904192319w5ed4ec4bs4c854ecdc540aaa4@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: devshell not working with screen remote shell
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
X-List-Received-Date: Mon, 20 Apr 2009 06:24:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

You might want to add this to your local.conf

TERMCMD = "${SCREEN_TERMCMD}"
TERMCMDRUN = "${SCREEN_TERMCMDRUN}"

devshell will open in a new screen session, witch you can attach to
manually.

Siebren

On Sun, Apr 19, 2009 at 8:35 PM, Marco Cavallini <koansoftware@gmail.com>wrote:

> devshell is not working when you run bitbake in a screen remote ssh shell
> (also potest here http://bugs.openembedded.net/show_bug.cgi?id=5084)
>
>
> $ bitbake -cdevshell bluez-utils
> NOTE: Handling BitBake files: - (6658/6658) [100 %]
> NOTE: Parsing finished. 6398 cached, 0 parsed, 260 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: build 200904192010: started
>
> OE Build Configuration:
> BB_VERSION        = "1.8.13"
> METADATA_BRANCH   = "stable/2009"
> METADATA_REVISION = "6ea387ca312c4686746c387b56735f7b96f599b3"
> TARGET_ARCH       = "i586"
> TARGET_OS         = "linux"
> MACHINE           = "qemux86"
> DISTRO            = "kaeilos"
> DISTRO_VERSION    = "2008.1-test-20090419"
>
> NOTE: oestats: build 140918
> ...snip...
> NOTE: package bluez-utils-3.36-r5: task do_patch: completed
> NOTE: Running task 32 of 32 (ID: 4,
> /home/koan/devel/openembedded/recipes/bluez/bluez-utils_3.36.bb,
> do_devshell)
> NOTE: package bluez-utils-3.36-r5: task do_devshell: started
> ERROR: function do_devshell failed
> ERROR: log data follows
>
> (/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/bluez-utils-3.36-r5/temp/log.do_devshell.5388)
> | cannot open display:
> | Run 'gnome-terminal --help' to see a full list of available command line
> options.
>
>
> I already tried to solve this time ago using different option in bitbake
> code
> (trying to activate xterm instead of the default x terminal) and trying
> to set
> DISPLAY and xauth in several ways without success.
>
> /marco
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

