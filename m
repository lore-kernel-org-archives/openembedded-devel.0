Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UQGT3-0006oo-RW
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 14:19:10 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Thu, 11 Apr 2013
	14:01:42 +0200
X-TM-IMSS-Message-ID: <02572ece000027d3@nedap.com>
Received: from [10.17.16.17] ([10.17.16.17]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 02572ece000027d3 ;
	Thu, 11 Apr 2013 14:01:43 +0200
Message-ID: <5166A626.2060107@nedap.com>
Date: Thu, 11 Apr 2013 14:01:42 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: error when bitbaking console-base-image (danny)
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
X-List-Received-Date: Thu, 11 Apr 2013 12:19:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
I've been experimenting with images, and every time I get this error 
even with a completely fresh build directory:

    log_check: There were error messages in the logfile
    log_check: Matched keyword: [Collected errors]

    Configuring connman.
    Configuring connman-systemd.
    Configuring tinylogin.
    Configuring angstrom-version.
    Configuring angstrom-packagegroup-boot.
    Collected errors:
      * extract_archive: Cannot create symlink from ./var/log to
    'volatile/log': File exists.
      * extract_archive: Cannot create symlink from ./var/run to
    'volatile/run': File exists.
    + '[' '!' -z '' ']'
    + package_tryout_install_multilib_ipk
    + multilib_tryout_dirs=


Could really use some help here...
Thanks!
Jaap

