Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TYyIl-0002f5-9H
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 13:12:11 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0122CF81225; Thu, 15 Nov 2012 04:58:15 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3669DF81224;
	Thu, 15 Nov 2012 04:58:14 -0700 (MST)
Message-ID: <50A4D8E7.1000907@mlbassoc.com>
Date: Thu, 15 Nov 2012 04:58:31 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50A43F5A.7030806@mlbassoc.com>
	<20121115070531.GP3928@jama.jama.net>
In-Reply-To: <20121115070531.GP3928@jama.jama.net>
Subject: Re: Unable to build python-pyqt
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
X-List-Received-Date: Thu, 15 Nov 2012 12:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-15 00:05, Martin Jansa wrote:
> On Wed, Nov 14, 2012 at 06:03:22PM -0700, Gary Thomas wrote:
>> I'm trying to build python-pyqt using the latest meta-openembedded
>> alongside Poky/Yocto distribution.  It's failing with a slew of errors:
>>
>> | arm-poky-linux-gnueabi-g++  -march=armv7-a     -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/local/p82_new/tmp/sysroots/my_target -c -pipe -pipe -pipe
>> -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -O2 -O2 -fPIC -fPIC -fPIC
>> -Wall -W -Wall -W -Wall -W -D_REENTRANT -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED -I/local/p82_new/tmp/sysroots/my_target/usr/share/qtopia/mkspecs/linux-g++ -I.
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia -I../../QtCore -I../../QtCore -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/Qt
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/python2.7 -I../qpy/QtCore -I../qpy/QtGui -I../qpy/QtDeclarative
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtDeclarative -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtWebKit
>> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtNetwork -I. -o qpycore_qabstracteventdispatcher.o qpycore_qabstracteventdispatcher.cpp
>> | In file included from ../../QtCore/sipAPIQtCore.h:33:0,
>> |                  from qpycore_sip.h:32,
>> |                  from qpycore_qabstracteventdispatcher.cpp:30:
>> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29: error: expected unqualified-id before ';' token
>> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52: error: expected ',' or '...' before 'new'
>> | In file included from qpycore_sip.h:32:0,
>> |                  from qpycore_qabstracteventdispatcher.cpp:30:
>> | QtCore/sipAPIQtCore.h:8603:8: error: 'pyqt4ClassTypeDef' does not name a type
>> | QtCore/sipAPIQtCore.h:8747:8: error: 'pyqt4ClassTypeDef' does not name a type
>> | QtCore/sipAPIQtCore.h:8752:8: error: 'pyqt4ClassTypeDef' does not name a type
>>           ...
>> | qpycore_qabstracteventdispatcher.cpp: In function 'bool event_filter(void*)':
>> | qpycore_qabstracteventdispatcher.cpp:98:5: error: 'SIP_BLOCK_THREADS' was not declared in this scope
>> | qpycore_qabstracteventdispatcher.cpp:104:5: error: expected ';' before 'PyObject'
>> | qpycore_qabstracteventdispatcher.cpp:107:9: error: 'msg_obj' was not declared in this scope
>> | qpycore_qabstracteventdispatcher.cpp:137:5: error: 'SIP_UNBLOCK_THREADS' was not declared in this scope
>> | qpycore_qabstracteventdispatcher.cpp:139:5: error: expected ';' before 'return'
>>
>> This is using the meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
>> Poky/Yocto master 1fd9a16d2
>>
>> I assume that this package built at the time of the last patch:
>
> Yes it did and still does here (4 different hosts) for both qt 4.8.1 and 4.8.3.

What distribution layers are you using?
What's your target?
What compiler are you using (currently I'm at 4.7.2-r13)?

I had troubles with sip-native:
   ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
   http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.13.3.tar.gz:
   2012-11-15 04:53:17 ERROR 404: Not Found.
How do you get around this?

I'd like to duplicate what you've done so I can figure out what's wrong.

>
>>     commit 00fe75fb5773cf5602a20a50ed299ed287dd6ebd
>>     Author: Martin Jansa <Martin.Jansa@gmail.com>
>>     Date:   Thu Oct 25 00:25:53 2012 +0200
>>
>>       python-pyqt: don't bypass sstate with sip files
>>
>>       * discovered with http://patchwork.openembedded.org/patch/38521/
>>
>>       Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> What might I be doing wrong that's breaking the build?
>
> I would check what's on those lines and is missing in your build
> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29:
> error: expected unqualified-id before ';' token
> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52:
> error: expected ',' or '...' before 'new'

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


