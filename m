Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JVtUt-0003Kv-5m
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Mar 2008 20:05:21 +0100
Received: by wr-out-0506.google.com with SMTP id c30so16152494wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Mar 2008 11:04:11 -0800 (PST)
Received: by 10.100.37.20 with SMTP id k20mr18094722ank.118.1204484651443;
	Sun, 02 Mar 2008 11:04:11 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Sun, 2 Mar 2008 11:04:11 -0800 (PST)
Message-ID: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
Date: Sun, 2 Mar 2008 20:04:11 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.184.235
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Sun, 02 Mar 2008 19:05:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,


I wonder if someone knows about a content addressable file server, or
content addressable URL server?

The idea is that the bitbake fetcher does not use the SRC_URI provided
URL per se, but can fall back to use the SHA1SUM or MD5SUM to ask
"something" for alternative locations of the package.


Such a "server" would implement a two table database:

|authentic file name|md5sum|sha1sum|

(the primary key is |md5sum|sha1sum|)

In a different table, all instances of valid URI that provide this
content are collected

|md5sum|sha1sum|URI|


Now, this might be a Google SoC project, and something that Google
should have already.


Regards,
-- 
Leon


