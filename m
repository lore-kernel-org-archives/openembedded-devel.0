Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 945EA65CE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 09:50:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X5AzJ-0002oI-6u for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2014 11:50:01 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:50:01 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 11:50:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Jul 2014 11:49:50 +0200
Message-ID: <lplnjv$9pf$1@ger.gmane.org>
References: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>	<20140709095544.GC2446@jama>
	<53BD17A1.6000205@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <53BD17A1.6000205@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe] [PATCH] fftwf and fftwl: exclude them from world
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jul 2014 09:50:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Yang schreef op 09-07-14 12:21:
> 
> 
> On 07/09/2014 05:55 PM, Martin Jansa wrote:
>> On Tue, Jul 08, 2014 at 11:18:47PM -0700, Robert Yang wrote:
>>> The fftw, fftwf and fftwl provide the same files (different
>>> contents), we should only build one of them, otherwise there would be
>>> warning
>>> 
>>> WARNING: The recipe fftw is trying to install files into a shared
>>> area when those files already exist. Those files and their manifest
>>> location are: sysroots/qemux86-64/usr/include/fftw3.f03 Matched in
>>> manifest-qemux86-64-fftwl.populate_sysroot 
>>> manifest-qemux86-64-fftwf.populate_sysroot 
>>> sysroots/qemux86-64/usr/include/fftw3.h Matched in
>>> manifest-qemux86-64-fftwl.populate_sysroot 
>>> manifest-qemux86-64-fftwf.populate_sysroot 
>>> sysroots/qemux86-64/usr/include/fftw3q.f03 Matched in
>>> manifest-qemux86-64-fftwl.populate_sysroot 
>>> manifest-qemux86-64-fftwf.populate_sysroot 
>>> sysroots/qemux86-64/usr/include/fftw3.f Matched in
>>> manifest-qemux86-64-fftwl.populate_sysroot 
>>> manifest-qemux86-64-fftwf.populate_sysroot 
>>> sysroots/qemux86-64/usr/include/fftw3l.f03 Matched in
>>> manifest-qemux86-64-fftwl.populate_sysroot 
>>> manifest-qemux86-64-fftwf.populate_sysroot Please verify which
>>> package should provide the above files.
>>> 
>>> and maybe errors (race issue):
>>> 
>>> The recipe imagemagick.do_compiler error: fourier.c:69:19: fatal
>>> error: fftw3.h: No such file or directory #include <fftw3.h>
>>> 
>>> This is because imagemagick.do_configure depends on
>>> fftw.populate_sysroot, but the files installed by
>>> fftw.populate_sysroot, maybe removed by fftwl or fftwf when they
>>> rebuild.
>>> 
>>> Only build fftw in the world will fix the problem.
>> 
>> But it doesn't fix the problem for people who are really building
>> fftwl and fftw. If there is someone with this use-case can he send
>> patch moving common parts to separate recipe used by all 3 or just
>> rename/move files to have unique name?
>> 
>> Or if they aren't needed at the same time, lets convert fftwl and
>> fftwf to PACKAGECONFIG options in fftw.
> 
> Yes, I think that PACKAGECONFIG is a good idea, will send patches
> tomorrow if no objections.

The original idea of the different packages was that you could have all the
libraries in the binary feeds since they are needed. With packageconfig that
becomes virtually impossible.
I don't have a suggestion to improve the current situation, though :(

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTvmG+MkyGM64RGpERAu1zAJsGXdlezcHjV4JFjhTj9zeSaJ271ACdERQE
Xye89UlN8wZ3HEmV0fNGYMQ=
=iZI9
-----END PGP SIGNATURE-----


