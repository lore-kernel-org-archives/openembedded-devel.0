Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OCHdq-0000bG-BP
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 21:30:51 +0200
Received: by gwj15 with SMTP id 15so204613gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=geRO6x/QgXidU2BQXQU5PWd7tgfTzP4Tg2esoTt4Lq4=;
	b=dol2/+YhhUv4P6VKEw2Tzw3dPHrf1M04ZpAgPpEgO6DkUbTCDTL18ACoToqJ+a0Ww1
	2YmyMAcU8YcyfNMLb52LLxQSvo9UacB3n5K8FKsuaWMcm0K5BbHDueoSWlDsfEFmrQsB
	H1W2XV/FgI+rY4/ZxdCUtWtODUk/RZGnHAQn8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HSIipTGbbeiAqCfkg7xuvdp4TcxMsWitk+2F6ohsDHyQpP93RLGN2ycP4cbHoCtKVU
	9yPisfUy10a+3Js/d8KnMusj/3eKTI7LtBo74Z0HG9ehl2IFjX3nCRyt0LrEi/qbVC9m
	MPkCqsNx6xFkSrDtfnPrsC5rRv2SO30AV4QC8=
MIME-Version: 1.0
Received: by 10.101.182.2 with SMTP id j2mr4616525anp.210.1273692413826; Wed, 
	12 May 2010 12:26:53 -0700 (PDT)
Received: by 10.100.154.13 with HTTP; Wed, 12 May 2010 12:26:51 -0700 (PDT)
In-Reply-To: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
References: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
Date: Wed, 12 May 2010 12:26:51 -0700
Message-ID: <AANLkTimpzBaBXWOHxgI3ubEb_koVlkRX9ACz1B2qpcX3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 19:30:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2010 at 11:08 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> Building from recent pull of oe.dev (yesterday)
>
> Anyone else seeing this?

post the logs  somewhere

-Khem

>
> Steve
>
>
> ERROR: function do_compile failed
> ERROR: log data follows
> (/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/temp/log.do_compile.29091)
> | NOTE: make -j 4
> | make =A0all-recursive
> | make[1]: Entering directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet'
> | Making all in src
> | make[2]: Entering directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet/src'
> | Making all in lib
> | make[3]: Entering directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet/src/lib'
> | =A0 CC =A0 =A0 libeet_la-eet_lib.lo
> | =A0 CC =A0 =A0 libeet_la-eet_data.lo
> | =A0 CC =A0 =A0 libeet_la-eet_image.lo
> | =A0 CC =A0 =A0 libeet_la-eet_cipher.lo
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
> | cc1: internal compiler error: in add_path, at c-incpath.c:425
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
> | cc1: internal compiler error: in add_path, at c-incpath.c:425
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | make[3]: *** [libeet_la-eet_image.lo] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | make[3]: *** [libeet_la-eet_data.lo] Error 1
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
> | cc1: internal compiler error: in add_path, at c-incpath.c:425
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | make[3]: *** [libeet_la-eet_lib.lo] Error 1
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/eina-0
> | cc1: internal compiler error: in add_path, at c-incpath.c:425
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | make[3]: *** [libeet_la-eet_cipher.lo] Error 1
> | make[3]: Leaving directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet/src/lib'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+=
svnr48617-r1/eet'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


