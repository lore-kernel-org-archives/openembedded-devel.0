Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J2Yue-0006sn-2D
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 22:14:40 +0100
Received: by nf-out-0910.google.com with SMTP id h3so300849nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2007 13:10:19 -0800 (PST)
Received: by 10.86.72.15 with SMTP id u15mr1075510fga.11.1197493818874;
	Wed, 12 Dec 2007 13:10:18 -0800 (PST)
Received: from ?192.168.61.156? ( [194.79.8.34])
	by mx.google.com with ESMTPS id p9sm9108645fkb.2007.12.12.13.10.16
	(version=SSLv3 cipher=OTHER); Wed, 12 Dec 2007 13:10:16 -0800 (PST)
Date: Wed, 12 Dec 2007 23:13:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <208459064.20071212231354@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <476005E5.5050605@gmx.net>
References: <475EDA2B.8080109@gmx.net>
	<c384c5ea0712120529m10874ac8g97faeac69e60024a@mail.gmail.com>
	<476005E5.5050605@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: merging recipes from Jalimo
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
X-List-Received-Date: Wed, 12 Dec 2007 21:14:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Wednesday, December 12, 2007, 6:01:41 PM, you wrote:

> Hi Leon,

> Leon Woestenberg schrieb:
>> Hello Robert,
>> I see the compile task assumes the availability of "javac".
>> 
>> javac -d build -source 1.4 -sourcepath source `cat $list`;
>> 
>> How do you expect this to be available on the host? Will any javac
>> that's out there be good enough to use?
> A Java 1.4 compatible compiler is needed. That can be the proprietary
> javac, gcj -C, jikes and ecj. Most distribution have some way to let the
> latter three be available as 'javac'.

> You may say that we could use jikes-native from OE then but that
> compiler needs (as all Java compilers) a class library. Jikes is not
> Java5-capable but GNU Classpath expects one since version 0.95. One
> could build an older GNU Classpath release just for this purpose but
> then there would still be no runtime to use ecj-bootstrap (which is a
> Java app itself). Additionally I wanted to stick with latest and
> greatest GNU Classpath (especially everything after the Java5 switch)
> releases since the older ones contain surprising bugs and miss important
> tools (gjar, gjavah etc).

> It is really a messy bootstrapping situation, I know. Since OE expects
> GCC being installed I think that gij and gcj can also be available on
> those systems.

>> Currently, OpenEmbedded tries to rely on a defined set of host tools
>> to be installed, and my concern is that we now must add one (out of a
>> set of acceptable) java compiler to that external dependency list. If
>> so, we must do so carefully.
> Yes, thats true. A java compiler and a runtime (both from the fairly old
> 1.4 times) are needed in the beginning. After ecj-bootstrap is built its
> only purpose is to built OE's own java runtime and compiler.

> If independence from those two pieces of software is important I could
> look into this. However I expect this to become complicated.

  As was discussed lately on this list, we should track the expected
host dependencies. This is done using ASSUME_PROVIDED in
conf/bitbake.conf. So, based on the above, I think you want to add
javac-native and java-runtime-native there. Then, your recipe should
DEPENDS on them, and in comment, please include the relevant
additional info above. This should be good compromise, as indeed,
complete self-bootstrapping would be a task in itself, sidetracking you
from the current work.


> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



