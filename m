Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SWipG-0005d7-RG
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 May 2012 08:44:10 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Tue, 22 May 2012
	08:34:01 +0200
X-TM-IMSS-Message-ID: <7631a6130021eadd@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 7631a6130021eadd ;
	Tue, 22 May 2012 08:34:05 +0200
Message-ID: <4FBB3356.2020702@nedap.com>
Date: Tue, 22 May 2012 08:33:58 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4FBA4C26.8070601@nedap.com>
	<CAMKF1sr2SEBY0_e4nwoUYeZ-vUxZtXz4S3RHy9rgHBes4n-NAg@mail.gmail.com>
In-Reply-To: <CAMKF1sr2SEBY0_e4nwoUYeZ-vUxZtXz4S3RHy9rgHBes4n-NAg@mail.gmail.com>
Subject: Re: update from 2010.12 to 2011.03
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
X-List-Received-Date: Tue, 22 May 2012 06:44:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


>> I have this device in the field with 2010.12 installed (glibc)
>> Suppose I'm going to upgrade it to 2011.03 (eglibc).
>> Is this possible at all?
>> Or should I stay with glibc based packages
> Glibc and eglibc are totally compatible so I don't see a reason why it
> won't work you will see ant upgrade related
> issues as you would see if you were to upgrade from say glibc 2.10 to 2.1
Well, I tried upgrading from glibc-2010.12 to eglibc-2011.03 ... and failed.
Then I thought maybe they weren't that compatible.

     ///
     Upgrading opkg on root from 0.1.8+svnr554-r31.6 to 
0.1.8+svnr609-r51.9...
     Downloading 
http://myrepository/ipk/armv5te/opkg_0.1.8+svnr609-r51.9_armv5te.ipk.
     Upgrading libopkg0 on root from 0.1.8+svnr554-r31.6 to 
0.1.8+svnr609-r51.9...
     Downloading 
http://myrepository/ipk/armv5te/libopkg0_0.1.8+svnr609-r51.9_armv5te.ipk.
     Removing obsolete file /etc/rcS.d/S98configure.
     Upgrading wget on root from 1.11.4-r8.05.6 to 1.11.4-r8.05.9...
     Downloading 
http://myrepository/ipk/armv5te/wget_1.11.4-r8.05.9_armv5te.ipk.
     Upgrading libssl1.0.0 on root from 1.0.0b-r13.1.6 to 1.0.0e-r15.0.9...
     Downloading 
http://myrepository/ipk/armv5te/libssl1.0.0_1.0.0e-r15.0.9_armv5te.ipk.
     wget: /usr/lib/libssl.so.1.0.0: version `OPENSSL_0.9.8' not found 
(required by wget)
     wget: /usr/lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not 
found (required by /usr/lib/libssl.so.1.0.0)
     wget: /usr/lib/libssl.so.1.0.0: version `OPENSSL_0.9.8' not found 
(required by wget)
     wget: /usr/lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not 
found (required by /usr/lib/libssl.so.1.0.0)
     ///

So, I build glibc based repository and surprise, surprise...
same error!

     ///
     Upgrading libopkg0 on root from 0.1.8+svnr554-r31.6 to 
0.1.8+svnr609-r51.9...
     Downloading 
http://myrepository/ipk/armv5te/libopkg0_0.1.8+svnr609-r51.9_armv5te.ipk.
     Removing obsolete file /etc/rcS.d/S98configure.
     Upgrading wget on root from 1.11.4-r8.05.6 to 1.11.4-r8.05.9...
     Downloading 
http://myrepository/ipk/armv5te/wget_1.11.4-r8.05.9_armv5te.ipk.
     Upgrading libssl1.0.0 on root from 1.0.0b-r13.1.6 to 1.0.0e-r15.0.9...
     Downloading 
http://myrepository/ipk/armv5te/libssl1.0.0_1.0.0e-r15.0.9_armv5te.ipk.
     wget: /usr/lib/libssl.so.1.0.0: version `OPENSSL_0.9.8' not found 
(required by wget)
     wget: /usr/lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not 
found (required by /usr/lib/libssl.so.1.0.0)
     wget: /usr/lib/libssl.so.1.0.0: version `OPENSSL_0.9.8' not found 
(required by wget)
     wget: /usr/lib/libcrypto.so.1.0.0: version `OPENSSL_1.0.0' not 
found (required by /usr/lib/libssl.so.1.0.0)
     ///

Any hint is appreciated!
Jaap




