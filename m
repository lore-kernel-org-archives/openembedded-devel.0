Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1P3VDs-0002Pr-9x
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:44:01 +0200
Received: by wwb17 with SMTP id 17so177640wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=SbxhQFK5csPLEkVzKnJ0F2ZkGd8Jt8/6Xy4A/cm+FAw=;
	b=Klh22r6b19JTfVmeWJH/n35BH8i4AfbobdthP56dWDsk3f1cTlH4LhfjcljNK6ttlf
	dR7VtLGYphsWLefIz/i1l/oPosLgr3TfLttGVaD8Yb7Er4g0KlcH1gPt105QO3Ooluh3
	KAjlgGcnLt7dLH29mkp5eoG52QPBDeU2iiA6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding;
	b=iIXOyKVlcIhNBjwrZoCguDz3lJaqQBwKd+K7ZXNbqbpHIV6jCz6gfwOikJyIoiXd4h
	1xoi4GCXSFWwHyOPZ/M9tqYH0o6WfYp6xjoRpd3qeyhzgP5qgb61BNB2GxScDFpxJilr
	awbs+TDUNVr/42DXfsotaN5xi0vTBuqa1Vcjg=
Received: by 10.216.35.78 with SMTP id t56mr10787301wea.34.1286376220069;
	Wed, 06 Oct 2010 07:43:40 -0700 (PDT)
Received: from [192.168.2.176] ([91.123.227.253])
	by mx.google.com with ESMTPS id r18sm655530weo.24.2010.10.06.07.43.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 07:43:39 -0700 (PDT)
Message-ID: <4CAC8B19.9050502@gmail.com>
Date: Wed, 06 Oct 2010 15:43:37 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: /usr/bin/fop ???
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
X-List-Received-Date: Wed, 06 Oct 2010 14:44:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

trying to "bitbake tangogps" and getting errors about /usr/bin/fop

I'm searching for a solution but not getting too far with that. I'm not
sure why and embedded verison of tangogps would require Apache FOP but
I'm on the wrong end of a learning curve.

Cheers for any pointers which would get me over this hurdle.

| [warning] /usr/bin/fop: Unable to locate fop in
/home/john/programming/openmoko/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/libx11-1_1.3.99.902-r9.0/image/usr/share/java
| Exception in thread "main" java.lang.NoClassDefFoundError:
org/apache/fop/cli/Main
| Caused by: java.lang.ClassNotFoundException: org.apache.fop.cli.Main
| 	at java.net.URLClassLoader$1.run(URLClassLoader.java:217)
| 	at java.security.AccessController.doPrivileged(Native Method)
| 	at java.net.URLClassLoader.findClass(URLClassLoader.java:205)
| 	at java.lang.ClassLoader.loadClass(ClassLoader.java:321)
| 	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:294)
| 	at java.lang.ClassLoader.loadClass(ClassLoader.java:266)
| Could not find the main class: org.apache.fop.cli.Main. Program will exit.
| make[1]: *** [Compose/index.ps] Error 1


