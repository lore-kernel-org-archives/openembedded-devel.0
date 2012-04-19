Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKnzc-000350-9L for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 11:49:36 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKnqT-0005kd-3a for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 11:40:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 11:40:09 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 11:40:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 Apr 2012 11:40:02 +0200
Message-ID: <jmomha$co7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Thu, 19 Apr 2012 09:49:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-04-12 11:09, Samuel Stirtzel schreef:
>>> Feel free to comment on the images.
>> 
>> Giving them a spin now :)
> 
> Thanks.
> 
> Just to let you know: Yesterday I accidentally added "inherit allarch" to
> kde-wallpapers, this will produce an error, I want to push my patch for
> this but Gitorious seems to be down.

Gitorious is down a lot, which is (partly) why I switched away from it.

> Removing allarch from kde-wallpapers will do the trick.

I'll update the repo in a minute. Some other things I ran into:

* rasqal needs PARALLEL_MAKE = ""
* soprano-native is needed for the onto2something binary, I did 'yum install
soprano' instead

The build has restarted due to the gcc patch and OEBasicHash, so it will be
a while before I can test these images.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPj91wAAoJEHZqAkdh1vT60T0QAKPi3WeWUixdKnYVEblnoOC3
qLw9kVglZ4RAbulOYylznNrDBzIxyDFi3aofO5M68vOLa0ng8V7EFZ+lOZgI3goI
wwd76JIXbu9P/pojE5jXhpU1gZiISnCwJrdkso6MRVXzi6UlS/PGEyORPhcX6KcS
IGSeV1aP+3LfJCbd0BVS3LZKALPcVlz6cVSqMi6KpmKvzeFaAN5PUtEH5soNCNh6
LR+hh9Q/Kz1wur3pk2mAWzj9B1uy+VtWN1vI/ywtEb1zXlvokI6NcwgKS/ZzBTOM
8KjaF4GqBpBSvHLJjyZrtjpTjIW6HMcic5IWAM1H/ta5X4mb6eOYFieGNnnaNU2v
t2uUDYqyxWvgNrhChrG3foF6/AMPhmyz53iDVwjdaG9/NuC3fniB80Cp7E9ejwrj
sPWJ2tZ/LcraDlMfvYEqe8KSa0UuV9PrD1FMA48JmWwR8s92lc4Ug67HsGv728KB
bRmQh3g/OKPupYrnwj8eddY30Anxz4sZADtXD5St5TTJKbuq3yidK/OA/bb/M1b1
CfTdvsWoYnPAAAcJkiQaptKf2g7NI7GYrXbdvcMDDbdj3NX9qfFAlHyGWsNThoNm
U8uievGsgyR8A1PxGPKdq72BauoZM28bJN9vZMEpgAJpx9kuO5wnZRzu7s/ZLuHg
1sWvYGV98ReHoDEMGNHA
=Z5pO
-----END PGP SIGNATURE-----



