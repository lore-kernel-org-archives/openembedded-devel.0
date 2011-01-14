Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1PdgQn-0005T8-Un
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 10:58:54 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 14 Jan 2011 10:57:18 +0100
X-TM-IMSS-Message-ID: <1ae962bd000095db@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1ae962bd000095db ;
	Fri, 14 Jan 2011 10:57:19 +0100
Message-ID: <4D301DFC.4090900@nedap.com>
Date: Fri, 14 Jan 2011 10:57:16 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 14 Jan 2011 09:57:18.0764 (UTC)
	FILETIME=[6E24E6C0:01CBB3D1]
Subject: chattr not found?
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
X-List-Received-Date: Fri, 14 Jan 2011 09:58:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All!

for some reason chattr is linked to chattr.e2fsprogs instead of 
../usr/bin/chattr.e2fsprogs

# ls -l /bin/chattr*
lrwxrwxrwx 1 root root   16 2011-01-14 10:37 /bin/chattr -> chattr.e2fsprogs

# ls -l /usr/bin/chattr*
-rwxr-xr-x 1 root root 7304 2010-12-10 01:12 /usr/bin/chattr.e2fsprogs

I have no time to investigate this.
Look simple...

Regards,
Jaap de Jong


