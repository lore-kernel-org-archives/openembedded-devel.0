Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.9176.1611645765113575396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 23:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Jdnx88eV;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611645763;
	bh=5afCIIXRiPGCffegMEMGfWFcP+VM7FdAY1Ijc++PEcE=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=Jdnx88eVs9MwLw7o0lAAoxJfO9f7Epuy0RNjJpBuJkTOT8vZt15PXYNTnmvunM6cl
	 9ac3Mcx6lzCr+GzmJhztkeiM2JB6D7P9m6xnfXSOJ7TiyqTrzralA8YQdWQeu3RfrC
	 oBfoc2n5PBydlN3Dn9oLSu+OWWd4xwUwbqZ4HP9E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from station.v.cablecom.net ([84.75.156.97]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MWRRT-1lW3tB3N0t-00Xu4C for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 08:22:42 +0100
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] networkmanager: Add Wireless Extensions to PACKAGECONFIG[wifi]
Date: Tue, 26 Jan 2021 08:22:41 +0100
Message-Id: <20210126072241.43425-2-n.jeker@gmx.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126072241.43425-1-n.jeker@gmx.net>
References: <20210126072241.43425-1-n.jeker@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8kqWxrl1KIdYDg5eThL8EdR1pJO9kwltwgHZei+4iz//kFqvF8X
 gVuJgEgTnF8xZDdI6M0nZ+dcr2UonxKU0Nswvzy9FsEdiUrXaJuBrTdvNN2YfbbmdZ0XQj4
 fvkdMQsqj+zKcGmUwdpoMrqCHAeRDbvQYBCzq6TYbMBDUA2IfmghNBFHbaWKXL4ej7u+eYP
 uL8qHRdxddx/b8fiNJgfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Aep5dP6wfb0=:9sHBVQ/sEmlfXwqLjKj2Og
 JIfdvAlW7ScdKsjKxUygt+dCng4Pi6meBjCWHSh4N6mNx3qgpzcaotpGN8oYJYwv62K49ufRn
 Dtf2AjdXeoXeFnWT0XgocEVZ+pAAZKHVMKGntht/Ktid+gxfhg5JViEWX24XUVrL6KjJLus51
 ObCPuDFT+1H3cLeyjfaL/C0mvXaWJnIKdRLmRtgqTAUJKdUo3rBc/Zuf46RsggVzdZARQZY3z
 5nzJzCGfmJPby03dBRoFVlghnbPLDmtAaQEdoxS9YQ+8LAJksP9Cb10+FOYAPbjBdGxmLrohd
 AA5D3QOJoIBOv8ypIx/XlQRqumwpwuxDRhfKfEZGGD0ee2V+7oXf3uVDTuhOX/Vy2KyX5aj6A
 abEoz4jvKpOxz040UFFGHoJTq+tncutHUvwiHJgSLmin+3zHVqic16usMbGWH02EuzsPBoEvX
 mFqQNRbcA26uZXDixcnR2JmxNpU1ZedJi3suNQ+BAdE0qlc1SC4beHYTa3F76EqZ1jiTf0hL6
 jA+HpcaMY99PI+Ao67QfKal2vNR6kiG/URf+rn5jef+DBcnrko6EVHdZEx4A1AX+0cuAzN9aR
 vlkJS6z+aSHppNZiypgDw5VeqwxwlWfWz42SnSylxXG5AgUndiAboYwfjQ71ZQDvc8G6fJinc
 UFYvWmVOhGuV3bkHACVQ5ghuRN9ERjfQBI3HKLV8LhM5ANnKkeOBLeVuS+fAZeIkPYZrYryfj
 SPfVqBQ+WQ2uBoW1AQ3zwkGKwHXl9MPrXESDZxPDzVdOJJBDgJGdHmqlSVIYE4k29fKyGP7ST
 qJldYNTQZGld1Y79cJpAcXjBtmYGYiIxOUUEa0wokcGtge2+HYoVZ598KDAT6FZisL7KdQJPO
 gYT20Qys19cjvTERGTUw==
Content-Transfer-Encoding: quoted-printable

Linux Wireless Extensions (Wext) support is enabled per default in
NetworkManager. Having Wext enabled without enabling WiFi support, too,
doesn't make much sense. Therefore, instead of creating a separate
PACKAGECONFIG flag, 'wext' was added to the already existing 'wifi'
flag.

Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
=2D--
 .../networkmanager/networkmanager_1.28.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.28.0.bb
index 157a7e7b0..1b4fa95a2 100644
=2D-- a/meta-networking/recipes-connectivity/networkmanager/networkmanager=
_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1=
.28.0.bb
@@ -80,7 +80,7 @@ PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/d=
nsmasq"
 PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
 PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resolv=
conf,,,resolvconf"
 PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls"
-PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable-wifi=3Dno,,wpa-supp=
licant"
+PACKAGECONFIG[wifi] =3D "--with-wext=3Dyes --enable-wifi=3Dyes,--with-wex=
t=3Dno --enable-wifi=3Dno,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-clo=
ud-setup=3Dno"
=2D-
2.30.0

