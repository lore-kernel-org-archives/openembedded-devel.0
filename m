Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Ia6mn-0007pz-9u
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2007 11:32:57 +0200
Received: by nf-out-0910.google.com with SMTP id h3so1335925nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 02:28:33 -0700 (PDT)
Received: by 10.86.33.10 with SMTP id g10mr2954241fgg.1190712512939;
	Tue, 25 Sep 2007 02:28:32 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.11])
	by mx.google.com with ESMTPS id v23sm12682796fkd.2007.09.25.02.28.31
	(version=SSLv3 cipher=OTHER); Tue, 25 Sep 2007 02:28:32 -0700 (PDT)
Date: Tue, 25 Sep 2007 12:28:30 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1436610692.20070925122830@gmail.com>
To: "pHilipp Zabel" <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30709242335g61947682m50a94dc5ca71c913@mail.gmail.com>
References: <E1IZwyx-0004wi-Cq@linuxtogo.org>
	<74d0deb30709242335g61947682m50a94dc5ca71c913@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev base-files: PocketPC machines: stop using random / mounts in fstab.
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
X-List-Received-Date: Tue, 25 Sep 2007 09:32:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello pHilipp,

Tuesday, September 25, 2007, 9:35:42 AM, you wrote:

> On 9/25/07, pfalcon commit
> <openembedded-commits@lists.openembedded.org> wrote:
>> base-files: PocketPC machines: stop using random / mounts in fstab.
>> * Instead, use rootfs mount, like most other devices do, which corresponds
>> to the fact that such machines can be booted from a lots of sources.
>>
[]

>> ============================================================
>> --- packages/base-files/base-files/hx4700/fstab 8913bf7229f7c689c52fe0ba7ebd9fb3aabd7c73
>> +++ packages/base-files/base-files/hx4700/fstab c03b2054bfd3ebc1f2b69c7387c4be0c1c38205f
>> @@ -1,4 +1,4 @@
>> -/dev/mtdblock2         /               jffs2   defaults                1  1
>> +rootfs         /               auto    defaults                1  1
>>  /dev/mtdblock3         /home   jffs2   defaults        1  1

> Any idea what to do about this one? Mounting /dev/mtdblock3 on /home
> should only be done if there isn't wince on flash anymore.

  IMHO, all machine-specific entries should be added to fstab by OS
installer (until then by users manually). And IMHO, default config
should be such that all flash is a single partition.

> regards
> Philipp


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



