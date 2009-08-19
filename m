Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1Mdi5g-0005j2-I1
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 12:08:24 +0200
Received: by bwz21 with SMTP id 21so3292858bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=8bEVGeol5/IE8QxuUc421R9WyKbAWg0wj5DyIapYzSE=;
	b=ro0fbwrsdluVjhJSXLBfD0QJabZSMODmW/H73YpPtMj5vRstYy+YUtuwNC8woB3MuV
	G+DprypgrhMoPiH4Kxw5W13LIAw+qM+SdgzZvXEZnV9fEMCEIm2zRyxY4NtAR96eq6vz
	uWExOkKpA3EuY/5AYD1S5xpvHkP/vsv4/oHfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=cY5IwQHIn4jLu81XTOvc+x5fSwYc0h4Vp1EI/kolYJ2Ne4fPxfIb6qO+BieIEei6PG
	Wzhgm/jnn+wtv2P6xVKbk1MRBjUwelT7/L1mq+3U0qXdy3JJXzlSDBbTrolr5lcze/Mh
	dAu04gLh2kYYSb20oV4uCeVGpUxuo3BZlwNNg=
MIME-Version: 1.0
Received: by 10.103.81.2 with SMTP id i2mr2386645mul.81.1250675471893; Wed, 19 
	Aug 2009 02:51:11 -0700 (PDT)
In-Reply-To: <h6gdpa$bft$1@ger.gmane.org>
References: <91283b620908182055l505fbbabt4dd5369f51cf260@mail.gmail.com>
	<h6gdpa$bft$1@ger.gmane.org>
Date: Wed, 19 Aug 2009 10:51:11 +0100
Message-ID: <91283b620908190251p5884ebc2o62b81255480ec47d@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Gumstix-users] Problem passing environment variables
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
X-List-Received-Date: Wed, 19 Aug 2009 10:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Here is what I had tried within the recipe to export:

do_configure_prepend () {
        export WORKING_DIR=~/overo-oe/SA/trunk
        export JSONHOME=$WORKING_DIR/JSON
        export
QTSTATE_DIR=$WORKING_DIR/build_dependencies/qtstatemachine-1.1-opensource
}

My qmake files are as follows:

within my user.collections/recipes/dockamp/files I have the follwoing:


TEMPLATE =subdirs
COMFIG   +=ordered
SUBDIRS  = \
    ~/overo-oe/SA/trunk/JSON/trunk \
    ~/overo-oe/SA/trunk/dockamp

This is the first place where I would like to use the environment variables.

Then within the ~/overo-oe/SA/trunk/dockamp/dockamp I have another
dockamp.pro file

TEMPLATE = app
TARGET = dockamp

include( $${WORKING_DIR}/settings.pri )
include( $${WORKING_DIR}/util/util.pri )
include( $${QTSTATE_DIR}/src/qtstatemachine.pri )

DEPENDPATH += \
    . \
    $$(WORKING_DIR)

INCLUDEPATH += \
    . \
    $$(WORKING_DIR)


When qmake gets to compiling my cpp files it fails as it cannot find the
.hpp file which is included, util.pri.

Previously I had hard coded the paths and it was compiling, but now it fails
no matter what I do. We had tried to add a do_compile as follows:

do_configure() {
    oenote Running our qmake work dir is $WORKING_DIR
    WORKING_DIR=${WORKING_DIR} JSONHOME=${JSONHOME}
QTSTATE_DIR=${QTSTATE_DIR} qmake2
~/overo-oe/user.collection/recipes/dockamp/files/dockamp.pro
    oenote Finished our qmake
}

But again we get the same result of .hpp files not found.

If the call to qmake2 can be made to pass the varaiable could you please
show the complete example. I am new to Linux and OE and it gets confusing
pretty quickly.

Thanks,
Stuart


2009/8/19 Koen Kooi <k.kooi@student.utwente.nl>

> On 19-08-09 05:55, Stuart Gray wrote:
>
> > I have also tried to add then into my environment setup changing my
> > .bashrc to add the variables. I have also added these to the
> > BB_ENV_EXTRAWHITE, but the variables are still not found.
>
> If you're going to pass variables intended for recipes using
> BB_ENV_EXTRAWHITE your QA dudes will have a nervous breakdown. If you
> want to pass something to a recipe using shell env, do 'export FOO =
> bar' in the recipe.
>
> regards,
>
> Koen
>
>
>
> ------------------------------------------------------------------------------
> Let Crystal Reports handle the reporting - Free Crystal Reports 2008 30-Day
> trial. Simplify your report design, integration and deployment - and focus
> on
> what you do best, core application coding. Discover what's new with
> Crystal Reports now.  http://p.sf.net/sfu/bobj-july
> _______________________________________________
> gumstix-users mailing list
> gumstix-users@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/gumstix-users
>

