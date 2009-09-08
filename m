Received: from [64.71.152.235] (helo=lirone.symas.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hyc@symas.com>) id 1MlB9O-00087Y-CD
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:35:09 +0200
Received: from [76.91.220.157] (helo=[192.168.1.29])
	by lirone.symas.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hyc@symas.com>) id 1Mkv9Z-0001gS-CN
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Sep 2009 00:30:13 -0700
Message-ID: <4AA607FF.4020607@symas.com>
Date: Tue, 08 Sep 2009 00:30:07 -0700
From: Howard Chu <hyc@symas.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64;
	rv:1.9.1b5pre) Gecko/20090819 SeaMonkey/2.0a1pre Firefox/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AA60682.1020309@symas.com>
In-Reply-To: <4AA60682.1020309@symas.com>
X-SA-Exim-Connect-IP: 64.71.152.235
X-SA-Exim-Mail-From: hyc@symas.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wpa_supplicant and GnuTLS
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
X-List-Received-Date: Wed, 09 Sep 2009 00:35:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Howard Chu wrote:
> On the Always Innovating TouchBook I've found that the wpa_supplicant always
> fails on WPA-EAP authentication in its default package, built with GnuTLS. It
> works fine when I rebuild it using OpenSSL. It's surprising the number of
> packages in the distro that depend on GnuTLS. I think you should seriously
> reconsider relying on such a volatile library in your builds.

Another note, looking at the diff of recipes/wpa-supplicant/files/defconfig 
and defconfig-0.6-gnutls

@@ -132,6 +95,10 @@
  # a file that usually has extension .p12 or .pfx)
  CONFIG_PKCS12=y

+# Smartcard support (i.e., private key on a smartcard), e.g., with openssl
+# engine.
+CONFIG_SMARTCARD=y
+
  # PC/SC interface for smartcards (USIM, GSM SIM)
  # Enable this if EAP-SIM or EAP-AKA is included
  #CONFIG_PCSC=y

...

+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS (needed for TLS/IA, see also CONFIG_GNUTLS_EXTRA)
+# none = Empty template
+CONFIG_TLS=gnutls
+

setting CONFIG_SMARTCARD is pointless since GnuTLS has no hardware engine 
support. (Or: using GnuTLS is pointless if you actually want smartcard support...)

-- 
   -- Howard Chu
   CTO, Symas Corp.           http://www.symas.com
   Director, Highland Sun     http://highlandsun.com/hyc/
   Chief Architect, OpenLDAP  http://www.openldap.org/project/


