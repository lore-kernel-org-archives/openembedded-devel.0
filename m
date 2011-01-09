Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Pc3am-0005jG-Fk
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 23:18:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D0181314CB8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jan 2011 23:18:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id h-FI94GZkNMv
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jan 2011 23:17:56 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id B78B7314CB8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jan 2011 23:17:56 +0100 (CET)
Message-ID: <4D2A3410.6090906@opendreambox.org>
Date: Sun, 09 Jan 2011 23:17:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101210 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294607270.4036.73.camel@mattotaupa>
In-Reply-To: <1294607270.4036.73.camel@mattotaupa>
Subject: Re: OT: determining in `Makefile.in` the Python version/path
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
X-List-Received-Date: Sun, 09 Jan 2011 22:18:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2011 10:07 PM, Paul Menzel wrote:
> I tried to use `python-config` to determine the Python version [3].
> 
>         ifeq (arm, $(ARCH))
>         -# Force external python2.5 for now!
>         -LIBS +=-lpython2.5
>         +# Force external Python for now!
>         +LIBS += $(shell python-config --libs)
>          endif
> 
> This fails with the following error though documented in `log.do_compile`.
> 
>         Traceback (most recent call last):
>           File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/bin/python-config", line 6, in <module>
>             from distutils import sysconfig
>           File "/oe/build/angstrom-dev/sysroots/i686-linux/usr/lib/python2.6/distutils/sysconfig.py", line 22, in <module>
>             PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> 

For OE's Python, you need to set some variables in your recipe, e.g.:

EXTRA_OECONF = " \
        BUILD_SYS=${BUILD_SYS} \
        HOST_SYS=${HOST_SYS} \
        STAGING_INCDIR=${STAGING_INCDIR} \
        STAGING_LIBDIR=${STAGING_LIBDIR} \
"

Regards,
Andreas


