Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PLqiE-0007OM-NR
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 06:19:11 +0100
Received: by pwi8 with SMTP id 8so344784pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 21:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=FA3p1cAvIQx7Yw4vlkhsNYs9bADrAmDJw1by5xtGq0g=;
	b=Dkksn575QStPHTMt2loPzMnRc6eULS7OH1d3tCN7kPW3rmLZDpTHSQoOmATK+jkqA/
	ynBowAWloS/W0opCylFl30l/L/nfUb5UwzIZa8jrGE2sD4kjXNG1q0SzSn5KSndnRBXY
	uLHFn0PXjwx696Ggo42EjiPQETDOMmWugbV/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=KtYXmCD7Jto4v7pW2GZz5iw9/SpOoFDOBDryZyi2VTV5vvJgvuwjlAbZjgXOSqKPCD
	LpmDljd1hdBswU9QuR4NNhRGxB7yi/c+P2WrikqiFG9mEd8oY86RJGYjjp7l7xI90vKp
	6MBlD6Z8uITjehHdInpmqNUN5WlTzxKWuOQr4=
Received: by 10.142.107.21 with SMTP id f21mr1710012wfc.427.1290748673599;
	Thu, 25 Nov 2010 21:17:53 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w42sm1999491wfh.3.2010.11.25.21.17.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 21:17:52 -0800 (PST)
Message-ID: <4CEF42F9.1090501@gmail.com>
Date: Fri, 26 Nov 2010 15:47:45 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Khem Raj : gcc-configure-sdk: Handle hardcoded /usr/include
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
X-List-Received-Date: Fri, 26 Nov 2010 05:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Commit 2e8e46955f15f54c78c91f1880a1bc776ac7fef9 doesn't seem to be enough
for me to getting a gcc-cross-sdk to build.


	    if ! false && test ! -d `echo /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`; then \
	      echo The directory that should contain system headers does not exist: >&2 ; \
	      echo "  `echo /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`" >&2 ; \
	      tooldir_sysinc=`echo "/usr/local/micro-uclibc/mipsel/lib/gcc/mipsel-oe-linux-uclibc/4.5.2/../../../../mipsel-oe-linux-uclibc/sys-include" | sed -e :a -e "s,[^/]*/\.\.\/,," -e ta`; \
	      if test "x`echo /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`" = "x${tooldir_sysinc}"; \
	      then sleep 1; else exit 1; fi; \
	    fi; \
	    /bin/sh /mnt/oe/tmp/work/x86_64-mipsel-sdk-oe-linux-uclibc/gcc-cross-sdk-4.5-r19.1+svnr166342/gcc-4.5/gcc/../mkinstalldirs ${fix_dir}; \
	    chmod a+rx ${fix_dir} || true; \
	    (TARGET_MACHINE='mipsel-oe-linux-uclibc'; srcdir=`cd /mnt/oe/tmp/work/x86_64-mipsel-sdk-oe-linux-uclibc/gcc-cross-sdk-4.5-r19.1+svnr166342/gcc-4.5/gcc; ${PWDCMD-pwd}`; \
	      SHELL='/bin/sh'; MACRO_LIST=`${PWDCMD-pwd}`/macro_list ; \
	      gcc_dir=`${PWDCMD-pwd}` ; \
	      export TARGET_MACHINE srcdir SHELL MACRO_LIST && \
	      cd ../build-x86_64-linux/fixincludes && \
	      /bin/sh ./fixinc.sh "${gcc_dir}/${fix_dir}" \
	        `echo /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`  ); \
	    rm -f ${fix_dir}/syslimits.h; \
	    if [ -f ${fix_dir}/limits.h ]; then \
	      mv ${fix_dir}/limits.h ${fix_dir}/syslimits.h; \
	    else \
	      cp /mnt/oe/tmp/work/x86_64-mipsel-sdk-oe-linux-uclibc/gcc-cross-sdk-4.5-r19.1+svnr166342/gcc-4.5/gcc/gsyslimits.h ${fix_dir}/syslimits.h; \
	    fi; \
	    chmod a+r ${fix_dir}/syslimits.h; \
	  done; \
	fi
The directory that should contain system headers does not exist:
  /mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/usr/include
make[2]: *** [stmp-fixinc] Error 1





It looks like NATIVE_SYSTEM_HEADER_DIR is not being set in gcc-configure-common.inc
(looking in gcc/Makefile I see NATIVE_SYSTEM_HEADER_DIR = /usr/include)

Sorry, I'm not familiar enough with gcc buildy bits to propose the correct fix.

-Graham


