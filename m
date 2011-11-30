Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVgat-0005fR-9y for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:36:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RVgUS-0006eu-Vr for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:30:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:30:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:30:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2011 10:27:22 +0100
Message-ID: <jb4stq$rmo$2@dough.gmane.org>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
	<ec55dac74706f161c53c7dda81f7df99305cf7ff.1322640506.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <ec55dac74706f161c53c7dda81f7df99305cf7ff.1322640506.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-efl 07/11] eeze: pass /bin/true instead of eject which is not available
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
X-List-Received-Date: Wed, 30 Nov 2011 09:36:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-11-11 09:16, Martin Jansa schreef:
> * hopefully better fix will be available upstream later 09:03:03 <
> discomfitor> only if an app makes an eject call 09:03:36 < discomfitor>
> in which case, the resulting exe call would be "/bin/true $mountpoint" 
> 09:03:39 < discomfitor> which would do nothing 09:03:55 < discomfitor> so
> you would break those apps, but it doesn't seem to be an issue for
> embedded... 09:08:06 < JaMa> ok, I meant if it would be better for those
> apps to know that eject functionality is not available, but if this is
> fine for you I can live with it too :) 09:09:26 < discomfitor> JaMa: hmm 
> 09:09:37 < discomfitor> JaMa: I will consider that
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-efl/recipes-efl/efl/eeze.inc |    3 +++ 1 files changed, 3
> insertions(+), 0 deletions(-)
> 
> diff --git a/meta-efl/recipes-efl/efl/eeze.inc
> b/meta-efl/recipes-efl/efl/eeze.inc index 4b13984..7a06f9d 100644 ---
> a/meta-efl/recipes-efl/efl/eeze.inc +++
> b/meta-efl/recipes-efl/efl/eeze.inc @@ -8,6 +8,9 @@ inherit efl 
> BBCLASSEXTEND = "native" INC_PR = "r2"
> 
> +# to make configure happy, but we don't have (and usually don't need)
> eject on target +EXTRA_OECONF += "--with-eject=${base_bindir}/true"

How about:

RRECOMMENDS_${PN} += "eject" ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7V9voACgkQMkyGM64RGpFm3ACcCBiZBj731XsqB7kdj9TAr/iy
m+sAoIz331YvgrWbO1A9xToOxLXj6maU
=qaIj
-----END PGP SIGNATURE-----



