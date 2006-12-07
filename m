Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GsSQz-0005wF-EC
	for openembedded-devel@openembedded.org; Fri, 08 Dec 2006 00:13:45 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kB7NCaLr030949 for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 Dec 2006 00:12:36 +0100
Message-ID: <45789FE4.5050702@dominion.kabel.utwente.nl>
Date: Fri, 08 Dec 2006 00:12:36 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GsP4r-0001Lz-4L@linuxtogo.org>
In-Reply-To: <E1GsP4r-0001Lz-4L@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev apache2: native and cross compile patches and BB files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2006 23:13:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

awilcox commit schreef:
> apache2: native and cross compile patches and BB files

[snip]

> +do_populate_staging () {
> +	cp srclib/pcre/dftables ../../../staging/i686-linux/bin/
> +	cp server/gen_test_char ../../../staging/i686-linux/bin/
> +	cp srclib/apr/apr-1-config ../../../staging/i686-linux/bin/
> +	cp srclib/apr-util/apu-1-config ../../../staging/i686-linux/bin/
> +	cp support/apxs ../../../staging/i686-linux/bin/
> +	chmod 755 ../../../staging/i686-linux/bin/apxs
> +	mkdir -p ../../../staging/build
> +	cp build/*.mk ../../../staging/build
> +	cat build/config_vars.mk | \
> +		sed -e '/^prefix/s,staging,staging/i686-linux,' | \
> +		sed -e '/^includedir/s,/include,/include/apache2,' | \
> +		sed -e 's,staging/bin,staging/i686-linux/bin,' > \
> +			../../../staging/build/config_vars.mk
> +	cp build/instdso.sh ../../../staging/build
> +	cp .libs/httpd ../../../staging/i686-linux/bin
> +
> +	(cd srclib/apr/.libs; tar -cf - libapr-*.so* ) |
> +	  (cd ../../../staging/i686-linux/lib; tar -xf - )
> +	(cd srclib/apr-util/.libs; tar -cf - libaprutil-*.so* ) |
> +	  (cd ../../../staging/i686-linux/lib; tar -xf - )
> +
> +    	mkdir -p ../../../staging/i686-linux/include/apache2
> +    	cp include/* ../../../staging/i686-linux/include/apache2
> +	cp os/unix/os.h ../../../staging/i686-linux/include/apache2
> +	cp os/unix/unixd.h ../../../staging/i686-linux/include/apache2
> +
> +  	cp support/envvars-std ../../../staging/i686-linux/bin/envvars
> +    	chmod 755 ../../../staging/i686-linux/bin/envvars
> +}

[snip]

Could someone replace those 'i686-linux' occurences with HOST_SYS or STAGING_BINDIR (or
whatever it is called now)?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFeJ/kMkyGM64RGpERAgNlAJ9lzw4iJB3vQ/JGg8N8xuSSj3kiCwCgjYE8
aXIkwyB9bbMAImQpuNeab5g=
=Bius
-----END PGP SIGNATURE-----


