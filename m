Received: from am-relay01.appliedminds.com ([12.0.85.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jsarrett@appliedminds.com>) id 1QCjDr-00019W-59
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 04:02:23 +0200
Received: from [10.10.20.137] (unknown [10.10.20.137])
	by am-relay01.appliedminds.com (Postfix) with ESMTPS id 9725A7DDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 18:57:04 -0700 (PDT)
Message-ID: <4DAF8E5C.3040705@appliedminds.com>
Date: Wed, 20 Apr 2011 18:54:36 -0700
From: James Sarrett <jsarrett@appliedminds.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-appliedminds-MailScanner-Information: Please contact IT for more information
X-appliedminds-MailScanner-ID: 9725A7DDD.A2B5E
X-appliedminds-MailScanner: Found to be clean
X-appliedminds-MailScanner-From: jsarrett@appliedminds.com
X-Spam-Status: No
Subject: opencv_2.2.bb recipe doesn't install libopencv_core.so
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
X-List-Received-Date: Thu, 21 Apr 2011 02:02:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm trying to bitbake OpenCV for a BeagleBoard-xM, and having limited 
success.  OpenCV builds and installs fine into /usr/lib, but it doesn't 
create (sym?-)links for the base shared objects.  In other words, after 
install there is a /usr/lib/libopencv_<opencvpart>.so.2.2 but no 
corresponding /usr/lib/libopencv_<opencvpart>.so or .a.  this causes the 
OpenCV samples to fail to build on the target (they install as source) 
because the cflags and libs returned by pkg-config are inconsistent. 
pkg-config assumes no version numbers (-llibopencv_core etc.).

Any help is appreciated,

-James Sarrett


