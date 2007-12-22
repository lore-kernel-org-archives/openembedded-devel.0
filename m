Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J63jb-0003UD-1U
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2007 13:45:46 +0100
Received: by fg-out-1718.google.com with SMTP id 22so347907fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2007 04:40:25 -0800 (PST)
Received: by 10.86.50.8 with SMTP id x8mr2231607fgx.61.1198327224991;
	Sat, 22 Dec 2007 04:40:24 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 12sm2933570fks.12.2007.12.22.04.40.22
	(version=SSLv3 cipher=OTHER); Sat, 22 Dec 2007 04:40:23 -0800 (PST)
Date: Sat, 22 Dec 2007 14:45:38 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1177027983.20071222144538@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <47690C8A.8090001@student.utwente.nl>
References: <1187652493.20071219133208@gmail.com>
	<47690C8A.8090001@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] BogoFeeds reloaded
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
X-List-Received-Date: Sat, 22 Dec 2007 12:45:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, December 19, 2007, 2:20:26 PM, you wrote:

[]

>> +
>> +       if [ -n "${FEED_LOCAL_BASE_URI}" ]; then
>> +           for arch in ${PACKAGE_ARCHS}
>> +           do
>> +               echo "src/gz local-$arch ${LOCAL_FEED_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/ipkg/local-$arch-feed.conf
>> +           done
>> +       fi
>>  }
>>  
>> So, you set FEED_LOCAL_BASE_URI to the root of deploy dir as exported
>> by Apache, and - voila - you get nice collection of per-arch local feeds in
>> the image.

> Could you add a comment in image.bbclass and local.conf.sample on how to
> use this, since it looks quite the same as FEED_URI to a new user, but
> is quite different? And while you are at it, update the OE usermanual as
> well?

  Ok, to make it more precise, I've renamed it to
FEED_DEPLOYDIR_BASE_URI. Added comments here and there.

  Edited also the manual, it lacked and FEED_* description at all, so
I've added section on it. I also rearranged chapters in manual so it
was more natural to learning reader: Intro - Getting Started -
everything else. Now, questions about manual availability. Is
http://www.openembedded.org/user-manual updated anyhow? It lacks
changes I made ~week ago to describe ASSUME_SHLIBS. There's no
mentioning of PDF manual on OE site, instead, there's news somewhere
deep on Angstrom site. And http://www.openembedded.org/%7Ekoen/usermanual.pdf
it links to dated 2007-10-09.

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



