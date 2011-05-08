Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIzUr-0006tE-Ha for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:37:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIzSD-0008V8-2v for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 10:35:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:35:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 10:35:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 10:34:22 +0200
Message-ID: <iq5kie$gie$3@dough.gmane.org>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>	<1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
	<1304836455.4124.7.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304836455.4124.7.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 02/11] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sun, 08 May 2011 08:37:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 08:34, Paul Menzel wrote:
> Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:
> 
> In the summary s/recipes/recipe/.
> 
>> This recipe is a merge of ntfs-3g and ntfsprogs thus the provides
>> entries.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   26 ++++++++++++++++++++
>>  1 files changed, 26 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
>>
>> diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
>> new file mode 100644
>> index 0000000..561f52a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "The NTFS-3G driver is an open source, freely available NTFS driver for Linux with read and write support."
>> +HOMEPAGE = "http://www.ntfs-3g.org/"
>> +DEPENDS = "fuse libgcrypt"
>> +PROVIDES = "ntfsprogs ntfs-3g"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>> +                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
>> +PR = "r0"
>> +
>> +SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
>> +S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> 
> Is not this the default for `S`?

Note the _ in S versus - in PN :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxlWNMkyGM64RGpERApN0AJwLMThuXGx9SkqZcUMocsODRiSoPgCeO+9Q
MegYIefPcxHvCdig9QS0vto=
=8Ucn
-----END PGP SIGNATURE-----



