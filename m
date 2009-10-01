Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MtOeh-0004u1-B3
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 18:37:26 +0200
Received: by qyk6 with SMTP id 6so267422qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2009 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nvNZO8BQC0ndXaD492dtCd/KPLdqAvgljU1L7G3ZKtc=;
	b=QT44DSXedxsd2VJU6MWN8iTosd944uIyS20UukDEeUAoxD/qLZIc0fLQZ4tuHUlz0Z
	e8kXbV7QXTV/Q4bv+BGS7iOBCM0vwG0+iXHCKduStvIAbl9rzH82XYuhh0rFK7LqAVCI
	CC92gme5juqdxBA5r5mTLVzim1XARIuld7Xts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mcN9JA0kz4LQCwYdnsP3cwhUOzpSn1Qv8X8S0K1WAni5yZwEFaaMuj5ioovuHdcT1t
	hXlD1n2cjRLr/XLfdteySS6zvUPVfnRQmRgcuHiPtPgH2vPLFUBYidRMymuVTs5GFyOE
	MJD8tLbrMguA9PnWzArIn2vbvLnj3w1rNvkaU=
MIME-Version: 1.0
Received: by 10.229.43.211 with SMTP id x19mr1878490qce.3.1254414998153; Thu, 
	01 Oct 2009 09:36:38 -0700 (PDT)
In-Reply-To: <ha2a3n$s6q$1@ger.gmane.org>
References: <1254397289.21355.57.camel@orest.ift.cs.uni-potsdam.de>
	<ha2a3n$s6q$1@ger.gmane.org>
Date: Thu, 1 Oct 2009 09:36:38 -0700
Message-ID: <19c1b8a90910010936y644282b1xe943f99e49cf5f38@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Failed to build opencv_1.0.0.bb recipe
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
X-List-Received-Date: Thu, 01 Oct 2009 16:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2009 at 6:16 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> Don't use -b unless you know what you are doing
>
> On 01-10-09 13:41, Ali Akbar Zarezadeh wrote:
>>
>> Hi,
>>
>> I am trying to build opencv_1.0.0.bb recipe with this command:
>>
>> bitbake -b /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb
>>
>> I've just faced with this error: "oe_runconf: command not found"
>>
>> Maybe this log would be helpful to get the point what happened:
>>
>>
>> ------------------------------------------------------------------------=
-------------------------
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 5 of 17 (ID:
>> 5, /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
>> do_configure)
>> __builtin__:6: DeprecationWarning: raising a string exception is
>> deprecated
>> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
>> while evaluating:
>> ${@python_dir(d)}
>> /opt/local/oe/bitbake/lib/bb/data_smart.py:92: DeprecationWarning:
>> raising a string exception is deprecated
>> =C2=A0 raise
>> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
>> while evaluating:
>> --disable-debug =C2=A0--without-gtk --without-python --disable-apps
>> az_python_cspec=3D${STAGING_INCDIR}/${PYTHON_DIR}
>> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native ?:None
>> while evaluating:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x ${S}/configure ] ; then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfgcmd=3D"${S}/co=
nfigure \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--b=
uild=3D${BUILD_SYS} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--h=
ost=3D${HOST_SYS} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--t=
arget=3D${TARGET_SYS} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--p=
refix=3D${prefix} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--e=
xec_prefix=3D${exec_prefix} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--b=
indir=3D${bindir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--s=
bindir=3D${sbindir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--l=
ibexecdir=3D${libexecdir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--d=
atadir=3D${datadir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--s=
ysconfdir=3D${sysconfdir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--s=
haredstatedir=3D${sharedstatedir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--l=
ocalstatedir=3D${localstatedir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--l=
ibdir=3D${libdir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--i=
ncludedir=3D${includedir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--o=
ldincludedir=3D${oldincludedir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--i=
nfodir=3D${infodir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--m=
andir=3D${mandir} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0${EXTRA_OECONF} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$@"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oenote "Running $=
cfgcmd..."
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cfgcmd || oefata=
l "oe_runconf failed"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oefatal "no confi=
gure script found"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>>
>> ERROR: function do_configure failed
>> ERROR: log data follows
>>
>> (/opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.d=
o_configure.24130)
>> |
>> /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/run.do=
_configure.24130:
>> line 745: oe_runconf: command not found
>> NOTE: Task
>> failed:
>> /opt/local/oe/tmp/work/ppc405-angstrom-linux/opencv-1.0.0-r2/temp/log.do=
_configure.24130
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build
>> of /opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb
>> do_configure failed
>> ERROR: Task 5
>> (/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb,
>> do_configure) failed
>> NOTE: Tasks Summary: Attempted 5 tasks of which 5 didn't need to be
>> rerun and 1 failed.
>> ERROR: '/opt/local/oe/openembedded/recipes/opencv/opencv_1.0.0.bb'
>> failed
>>
>>
>> ------------------------------------------------------------------------=
-------------------------
>>
>> I would be grateful if somebody would help me to figure out the problem.
>>
>> CIAO
>> Ali
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


IOW what Koen said, you are missing dependencies which wont be built
if you use -b
you are better off doing bitbake opencv this will also build
dependencies for you.

-Khem


