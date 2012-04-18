Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKYRv-0006ig-2s for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 19:13:47 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKYIm-0001wO-2A for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 19:04:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 19:04:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 19:04:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Apr 2012 19:04:04 +0200
Message-ID: <jmms5t$k4d$1@dough.gmane.org>
References: <20120418085611.C6AA710216@opal>
	<20120418092930.GF3635@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <20120418092930.GF3635@jama.jama.net>
X-Enigmail-Version: 1.4
Subject: Re: [oe-commits] Koen Kooi : gateone: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
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
X-List-Received-Date: Wed, 18 Apr 2012 17:13:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-04-12 11:29, Martin Jansa schreef:
> On Wed, Apr 18, 2012 at 08:56:10AM +0000, git@git.openembedded.org
> wrote:
>> Module: meta-openembedded.git Branch: master Commit:
>> ca5e7197524efef0961bdbbe111f6dd16f1d46b4 URL:
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=ca5e7197524efef0961bdbbe111f6dd16f1d46b4
>>
>>
>> 
Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Wed Apr 18 10:45:41 2012 +0200
>> 
>> gateone: silence systemd bbclass WARNING, ${PN}-systemd is unwanted
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> 
>> ---
>> 
>> .../recipes-connectivity/gateone/gateone_git.bb    |    1 + 1 files
>> changed, 1 insertions(+), 0 deletions(-)
>> 
>> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
>> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb index
>> 2469f9e..983dc24 100644 ---
>> a/meta-oe/recipes-connectivity/gateone/gateone_git.bb +++
>> b/meta-oe/recipes-connectivity/gateone/gateone_git.bb @@ -24,6 +24,7 @@
>> do_install_append() { install -m 0644 ${WORKDIR}/gateone-avahi.service
>> ${D}${sysconfdir}/avahi/services/ }
>> 
>> +NATIVE_SYSTEMD_SUPPORT = "1"
> 
> what exactly do you mean by native support?
> 
> gateone.service is added to SRC_URI like in other systemd supporting 
> recipes and packaging it in own subpackage would silence the warning it
> too.
> 
> I'm fine with those changes, just wondering what's the advantage and 
> "native" here.

if your recipe only has systemd support and no sysvinit, it makes little
sense to split out a ${PN}-systemd.
Anyway, the warnings about stuff that isn't going to get "fixed" are gone now.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPjvP/AAoJEHZqAkdh1vT6NesP/1A9An6hjLXNTufcBoE2a0Fo
J4eDzAzttJtfjnhsd9bKywDyKh5KfyFqccCKm2/vnUsvRwsyoqIy8bveFYWFXvKQ
NRYAjqmLXYSXrnU4Dyg1/oDgZIIkstl8mUJbByT2sZYjv1VYcRHA02ph7pRVnES1
tDWMckzpesCc8506xd1qBCF4zphB+llE6T0YwaeP13EL6h2XtQJYm+5iepDusnjv
eFFZwbFJHWUHOfkWdDFP5fCRmXqDPSlt86nj1AEA3EDHFVaaGkxBbH0zqCuHbYQy
OcXIEo/TYuonU4croavQtrKxYgNbm4a74Ypsx4JT31wtGteCC8YLpQ8ZWbg39UX1
v7tmNMV4u9UBeveobc0pZ29Trr9rDYWvBVYueP0YziBiF4gMkXfW8c/rmekVhnnb
uHqlr/RF+5c2hKg7CZE3PN6DbsvfDTKxgYcXaMbvETXlgXgV/L+Ev7Cf52t+rJF+
HB90RDLcmUaBERm35zDMPaxo7mk7YK/cY5XbC42eKkOXrwzqxiq321LETKJ0Ci72
SJVrRnvNdhi0fcDMkWddOk/IQQ/7gvrU/VYusTUMuAbnhzS0uAJoqDMmKepWRQOy
hgy7DjrromIKcIR3LP4Xcqgb6Xv+NcFrTRpuN2iVWvTcEuTlFhA3ML5UlCDKkOoL
QSgigGMh+ZlcvqV3jSoP
=3sHA
-----END PGP SIGNATURE-----



