Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RnG1R-0007Xa-QV
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jan 2012 21:52:49 +0100
Received: by qcsp14 with SMTP id p14so2162871qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2012 12:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=SO72xgMqQyoWHPbe6sJlqg30omWTxRshnzDv04EGPo8=;
	b=EJeYTSMGX0dNfZBtB1X7ZYGofiyy8Y8RTIsp69gJSagntRl3CEEMjOE3kinOOa2Pco
	AdbkQEGzw1E6hF/Z/+MctBoVMqMB0E9XPrtkPdzKZwNVPWpsn8Is7iLXUWqHxdE4/PHd
	LIf8lV6KXxSg9NFX5+SwRWW+AOTd2AEO7emzk=
MIME-Version: 1.0
Received: by 10.229.136.11 with SMTP id p11mr6961151qct.4.1326833112174; Tue,
	17 Jan 2012 12:45:12 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Tue, 17 Jan 2012 12:45:11 -0800 (PST)
In-Reply-To: <CA+C88Rn9Y6VdJ-Per2rQ2RFTbqu3m6BGaFCMLsHPngyAcwi0Tg@mail.gmail.com>
References: <4EF2F380.80704@celestialaudio.com>
	<20111223223753.GA20360@denix.org>
	<CACW_hTbZ=9HZNZGouQoWvLcc2WmDP4O+i+ooF98DYHWOXK79Jw@mail.gmail.com>
	<20111226041239.GA2321@denix.org>
	<CA+C88Rn9Y6VdJ-Per2rQ2RFTbqu3m6BGaFCMLsHPngyAcwi0Tg@mail.gmail.com>
Date: Tue, 17 Jan 2012 13:45:11 -0700
Message-ID: <CA+M6bXm_5_q_A_wfDNYn-gU-CEVhRGHNmakDgRcrOcJT7rFbrA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Tue, 17 Jan 2012 20:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 4, 2012 at 3:08 AM, Angus Lees <alees@google.com> wrote:
> On Mon, Dec 26, 2011 at 15:12, Denys Dmytriyenko <denis@denix.org> wrote:
>
>> On Sun, Dec 25, 2011 at 09:11:36PM +0100, Frans Meulenbroeks wrote:
>> > 2011/12/23 Denys Dmytriyenko <denis@denix.org>
>> > Actually bumped into this today as well; I saw maintenance moved back to
>> > 1.14.6 or so.
>> > Latest version is about 1.18.2.2.
>> >
>> > Guess we should either move master back to 1.14.6, or maybe even move to
>> a
>> > newer version. or fix the url to point to the snapshot copy.
>>
>> So, instead of always chasing the very latest version, why not simply set
>> the
>> Debian mirror variable on a per-distro basis?
>
>
> Or stick to a fakeroot release that was in a Debian (stable) release, and
> hence will be around for a while.

I'm not sure what problem people are having currently.  An empy DL_DIR
build with DISTRO=angstrom-2008.1 and MACHINE=beagleboard does this:
NOTE: package fakeroot-native-1_1.14.5-r0.0: task do_fetch: Started
--2012-01-17 13:42:12--
http://snapshot.debian.org/archive/debian/20110301/pool/main/f/fakeroot/fakeroot_1.14.5.orig.tar.bz2

Which works and finds the expected file with expected hashes.  This is
because the fakeroot recipe doesn't use DEBIAN_MIRROR now but directly
uses a date-encoded URL on snapshot.debian.org.

-- 
Tom


