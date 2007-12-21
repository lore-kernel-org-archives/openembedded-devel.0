Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5W2f-0007E8-DT
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 01:47:09 +0100
Received: by fg-out-1718.google.com with SMTP id 22so42247fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2007 16:42:00 -0800 (PST)
Received: by 10.86.58.3 with SMTP id g3mr553359fga.1.1198197720196;
	Thu, 20 Dec 2007 16:42:00 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id f31sm647910fkf.15.2007.12.20.16.41.58
	(version=SSLv3 cipher=OTHER); Thu, 20 Dec 2007 16:41:58 -0800 (PST)
Date: Fri, 21 Dec 2007 02:47:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1344229699.20071221024715@gmail.com>
To: Grant Edwards <grante@visi.com>
In-Reply-To: <fkerm2$nnf$1@ger.gmane.org>
References: <fk9u44$rgn$1@ger.gmane.org> <fkerm2$nnf$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How do you find a rev of OE that will build?
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
X-List-Received-Date: Fri, 21 Dec 2007 00:47:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Grant,

Friday, December 21, 2007, 12:51:46 AM, you wrote:

> On 2007-12-19, Grant Edwards <grante@visi.com> wrote:

>> I've been following the GettingStarted page trying to build
>> task-bask for about a week now, and I always hit errors due to
>> failed patches.  Here's the error du jour after doing a
>> pull/update about a half hour ago:
>>
>> [...]
>> NOTE: Running task 284 of 976 (ID: 650, /home/grante/quarq/oe/org.openembedded.dev/packages/python/python-native_2.5.1.bb, do_patch)
>> NOTE: package python-native-2.5.1: started
>> NOTE: package python-native-2.5.1-ml1: task do_patch: started
>> NOTE: Applying patch 'bindir-libdir.patch'
>> ERROR: Error in executing: 
>> ERROR: Exception:__builtin__.CmdError Message:Command Error: exit status: 1  Output:
>> Applying patch bindir-libdir.patch
>> patching file Makefile.pre.in
>> Hunk #1 FAILED at 78.
>> 1 out of 1 hunk FAILED -- rejects in file Makefile.pre.in
> [...]

> I updated today and tried again.  No joy.  python-native_2.5.1
> still fails when applying patches with the same error.

> Is there a way to tell bitbake to use an older version of the
> package -- presuming there are older versions that will build?

> Are packages in the .dev branch normally unbuildable for
> extended periods of time?  Should I not be trying to build
> using the .dev branch?

  No, anything on critical path to build a common embedded system
image can't be broken and unnoticed for long. I rebuilt python-native
for you:

NOTE: package python-native-2.5.1-ml1: task do_patch: started
NOTE: Applying patch 'bindir-libdir.patch'
NOTE: Applying patch 'cross-distutils.patch'
NOTE: Applying patch 'dont-modify-shebang-line.patch'
NOTE: Applying patch 'default-is-optimized.patch'
NOTE: package python-native-2.5.1-ml1: task do_patch: completed

      Anyway, as you see, it's not some dark magic failing, but merely
a patch application. So, why don't you look closer and see what
corrupts the data - your tar, a quilt built on your system, or your
kernel? ;-) And the best place to continue this is the bugtracker.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



