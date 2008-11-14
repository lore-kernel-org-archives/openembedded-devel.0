Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1L17sz-0005G0-P8
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 00:15:34 +0100
Received: from [92.117.2.142] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1L17qu-0003XH-Q7
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 00:13:25 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Nov 2008 00:04:50 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200811150004.50508.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.2.142
Subject: [gstreamer] Enabling binary cache (instead of the xml one)
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
X-List-Received-Date: Fri, 14 Nov 2008 23:15:34 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey Guys,

I wonder if we have ever considered in using the experimental gstreamer 
feature to build it with "--enable-binary-registry".

This is not changing the way the registry is working, the result is simply 
stored in binary and not xml. This avoids parsing on start.

For devices like the neo (with incredible slow flash speed) avoiding stating 
all plugins would (changing the way the registry is working) would be a lot 
better...

what do you think? Risk and use an experimental feature (it is using mmap so 
the risk of SIGBUS is there)

	z.



Results of micro benchmark on my neo:

Binary cache:

# Building cache
Total count: 119 plugins, 351 features
real    0m 12.36s
user    0m 5.71s
sys 0m 5.72s

# Cached
Total count: 119 plugins, 351 features
real    0m 1.74s
user    0m 1.03s
sys 0m 0.35s


XML Cache:
# Building cache
Total count: 119 plugins, 351 features
real    0m 16.42s
user    0m 6.94s
sys 0m 9.19s


# Cached
Total count: 119 plugins, 351 features
real    0m 1.87s
user    0m 1.28s
sys 0m 0.41s
root@om-gta02:~# 



