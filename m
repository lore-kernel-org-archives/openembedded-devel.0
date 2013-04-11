Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UQHSJ-0003r3-7l
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 15:22:28 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Thu, 11 Apr 2013
	15:05:00 +0200
X-TM-IMSS-Message-ID: <02911f0500002c4c@nedap.com>
Received: from [10.17.16.17] ([10.17.16.17]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 02911f0500002c4c ;
	Thu, 11 Apr 2013 15:05:00 +0200
Message-ID: <5166B4FB.7080100@nedap.com>
Date: Thu, 11 Apr 2013 15:04:59 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5166A626.2060107@nedap.com> <20130411123313.GD2477@jama>
In-Reply-To: <20130411123313.GD2477@jama>
Subject: Re: error when bitbaking console-base-image (danny)
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
X-List-Received-Date: Thu, 11 Apr 2013 13:22:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/11/2013 02:33 PM, Martin Jansa wrote:
> On Thu, Apr 11, 2013 at 02:01:42PM +0200, Jaap de Jong wrote:
>> Hi All,
>> I've been experimenting with images, and every time I get this error
>> even with a completely fresh build directory:
>>
>>      log_check: There were error messages in the logfile
>>      log_check: Matched keyword: [Collected errors]
>>
>>      Configuring connman.
>>      Configuring connman-systemd.
>>      Configuring tinylogin.
>>      Configuring angstrom-version.
>>      Configuring angstrom-packagegroup-boot.
>>      Collected errors:
>>        * extract_archive: Cannot create symlink from ./var/log to
>>      'volatile/log': File exists.
>>        * extract_archive: Cannot create symlink from ./var/run to
>>      'volatile/run': File exists.
> Looks like you have inconsistency between fs-perms.txt
> (e.g. default openembedded-core/meta/files/fs-perms.txt)
> and what .ipk files are packaging as /var/log and /var/run (probably
> from base-files, but /var/run is also included in dbus and other
> packages).
No differences with denzil.
I did a bitbake core-image-base and that compiles without a problem.
Thanks for sharing our thoughts!

>>      + '[' '!' -z '' ']'
>>      + package_tryout_install_multilib_ipk
>>      + multilib_tryout_dirs=
>>
>>
>> Could really use some help here...
>> Thanks!
>> Jaap
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



