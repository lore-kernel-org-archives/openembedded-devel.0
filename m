Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SINlT-00039L-4l for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 19:24:59 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SINcS-0005Cx-5w for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 19:15:40 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 19:15:40 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 19:15:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Apr 2012 19:15:28 +0200
Message-ID: <jm72ji$3r7$1@dough.gmane.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>	<1334185891-25460-3-git-send-email-philip@balister.org>
	<jm5ue3$ggg$1@dough.gmane.org> <4F870D05.5070308@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <4F870D05.5070308@balister.org>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe 2/5] python-cheetah : Remove DEPENDS on python native packages.
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
X-List-Received-Date: Thu, 12 Apr 2012 17:24:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-04-12 19:12, Philip Balister schreef:
> On 04/11/2012 11:58 PM, Koen Kooi wrote:
>> Op 12-04-12 01:11, philip@balister.org schreef:
>>> From: Philip Balister <philip@opensdr.com>
>> 
>>> The oe-core recipe no longer explicitly provides various -native 
>>> packages. THe recipe builds fine without them.
>> 
>> These are _R_DEPENDS, have you verified that it runs without them?
> 
> The -native versions are only needed at build time.
> 
> I do not have an easy way to runtime test the build quite yet, but I 
> would like to get the recipes in meta-oe building something that is more 
> useful than the existing recipes. I can handle small fixes in updates.

This one introduces a big breakage, so it isn't going in.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPhw2uAAoJEHZqAkdh1vT6Pz0P/30LQ1aXP83KmOWkkqWHB2Xy
EEHX6oXohG0oYGQ4zSEOwtRmhOXu/P1fSnf2QaZb6mq7gdKxem7qpUiAzsnhBiZc
iePFPiByj88Do+tCVxHy+IpaL4JnBa7bKWmtHkGdOlwfISFMjJ6RZLu4FK7tF0gu
RRSgJ4qSSFawbAyMYoUIngUA+TCOj4c+Vv4Tvf7+OgZZxf23fMoHSUiOwlXJkRVI
8LKDAJVLuwYyQd5C4PIImnQnri277Oxhn8chtb3beXKvKhlWGl0jBNUdsPcCL01b
Kq39RgZfCU92ziZ9duobHvu6rFoE4qJdIKDPeD84aiwcepK+wtIuV1pNtDJVML7S
nwAmf3Ti6b62R6Tn8MIBEhmQC1q6Szrm70S1DN2wnnK49KPyPlYUlrJg07LwTiBD
aiEwPj5R8YenMRtER42V0E0MsPworH4+8dQscL2lPr6sUIj2GpyG4U2/bzW+V0NO
XEjjnA1o8G2Pj5I8dmgLOs25HzjL6DjMSLsQBkuveUxPuv0tJLFbUT2ec9detq5m
gLYJbJIfO9B2x+aUrclO0T+Tnzg931KQzY6zRblg5K6/+kHlQOtBeSZG6hLpJHSP
3zRAUilGyetI8gwijNOKAkhwi1+c5z/HgEHv2dd/KfDOYPEmqcgVCOZ+Fc3DSX5j
HQUmdjL7QUI0kLSdggO5
=PjhG
-----END PGP SIGNATURE-----



