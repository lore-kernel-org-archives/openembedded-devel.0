Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Hl0h5-0004CA-N4
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2007 12:43:51 +0200
Received: by py-out-1112.google.com with SMTP id n39so1116972pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2007 03:43:30 -0700 (PDT)
Received: by 10.35.76.9 with SMTP id d9mr10987683pyl.1178534610150;
	Mon, 07 May 2007 03:43:30 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 40sm6024828nzf.2007.05.07.03.43.29;
	Mon, 07 May 2007 03:43:29 -0700 (PDT)
Date: Mon, 7 May 2007 13:43:31 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1019023621.20070507134331@gmail.com>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <463F01CF.5010601@dominion.kabel.utwente.nl>
References: <a7f8874a0702280825j22bdf3bbw94e58cfd4a0fab93@mail.gmail.com>
	<45F0200B.9080002@dominion.kabel.utwente.nl>
	<463F01CF.5010601@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Potential Problems in glibc-package.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2007 10:43:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, May 7, 2007, 1:39:11 PM, you wrote:

[]

>>> I think I may have stumbled across some potential bugs in glibc-package.bbclass:
>> 
>>> it seems like the standard value for datadir is /usr/share which will
>>> cause the following problems in output_locale_binary:
>> 
>>> 1) i18npath will be set to /usr/share/i18n instead of
>>> treedir/usr/share/i18n becouse path.join is too braindead to remove
>>> leading / on path entries.
>>> 2) the --inputfile option in localdef opts uses datadir instead of
>>> treedir, so it looks like it would use the locale files installed on
>>> the host instead of the ones we are buildig for.
>> 
>> 
>> There now is a base_path_join function in OE, that doesn't have that bug. No idea why
>> glibc.bbclass hasn't been updated to use that.

> See http://bugs.openembedded.org/show_bug.cgi?id=1821#c9 for the proposed solution for at
> least 1).

        This is indeed few months old. Let's apply it?


> regards,

> Koen

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



