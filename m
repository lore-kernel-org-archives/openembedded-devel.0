Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1Teq29-000151-EH
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 17:35:17 +0100
Received: (qmail 28703 invoked from network); 1 Dec 2012 16:14:18 -0000
Received: from unknown (66.41.60.82)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	01 Dec 2012 16:14:17 -0000
Message-ID: <50BA2CD8.3000400@pabigot.com>
Date: Sat, 01 Dec 2012 10:14:16 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Sat, 01 Dec 2012 16:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

I don't know how to reply to mail that was sent while I was unsubscribed, so:

http://patches.openembedded.org/patch/39697

was rejected per below, but still needs to be applied to danny.

Peter

[[meta-networking][PATCH]*ntp*:*fix*  *checksum*] On 12.11.27 (Tue 17:19) Eric Bénard wrote:
> commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to
> a newer version but didn't update the*checksum*  so fetch is failing.
>
> Signed-off-by: Eric Bénard <eric <at> eukrea.com>
> ---
>  meta-networking/recipes-support/*ntp*/*ntp*_4.2.6p5.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/*ntp*/*ntp*_4.2.6p5.bb b/meta-networking/recipes-support/*ntp*/*ntp*_4.2.6p5.bb
> index f7c5b68..0fce5ce 100644
> --- a/meta-networking/recipes-support/*ntp*/*ntp*_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/*ntp*/*ntp*_4.2.6p5.bb
> @@ -8,8 +8,8 @@ SRC_URI = "http://www.eecis.udel.edu/~*ntp*/*ntp*_spool/*ntp*4/*ntp*-4.2/*ntp*-${PV}.tar.g  <http://www.eecis.udel.edu/%7Entp/ntp_spool/ntp4/ntp-4.2/ntp-$%7BPV%7D.tar.g>
>          file://*ntp*date \
>  "
>
> -SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
> -SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
> +SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
> +SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
>
>  EXTRA_OECONF += " --with-net-snmp-config=no --without-*ntp*snmpd"
>

I didn't merge the patch since the change is included in the updates I
merged from PaulE.

--
-Joe MacDonald.
:wq


