Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1PxEHy-0004E8-2u
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 08:58:34 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 9 Mar 2011 08:55:35 +0100
X-TM-IMSS-Message-ID: <102d4d8500005e5b@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 102d4d8500005e5b ;
	Wed, 9 Mar 2011 08:55:35 +0100
Message-ID: <4D773276.1040907@nedap.com>
Date: Wed, 09 Mar 2011 08:55:34 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Mar 2011 07:55:35.0424 (UTC)
	FILETIME=[5F522800:01CBDE2F]
Subject: release-2011.3
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
X-List-Received-Date: Wed, 09 Mar 2011 07:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've been building release-2011.3 with DISTRO=angstrom-2008.1.
Builds without problems.
If I use DISTRO=angstrom-2010.x and start a complete new fresh build, I get

NOTE: Handling BitBake files: - (0263/7348) [ 3 %]ERROR: EOL while 
scanning string literal (<expansion>, line 1) while parsing 
/OpenEmbedded/release-2011.3/org.openembedded.dev/recipes/uclibc/uclibc_0.9.31.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<expansion>, line 1) while evaluating:
${@oe_filter_out('(-L\S+|-l\S+)', '-Wl,-O1 ${TARGET_LINK_HASH_STYLE}', d)}
ERROR: EOL while scanning string literal (<expansion>, line 1) while 
parsing 
/OpenEmbedded/release-2011.3/org.openembedded.dev/recipes/uclibc/uclibc_0.9.31.bb

Probably something stupid I have missed....
Any ideas?

Thanks!
Jaap


