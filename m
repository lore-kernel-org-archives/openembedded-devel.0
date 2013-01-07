Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gopikrishnans@pec.edu>) id 1TsBqe-0001y9-1o
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 13:30:37 +0100
Received: by mail-la0-f53.google.com with SMTP id fn20so15120378lab.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=6XN0mJGQmTzFZ/8l0hE8Z5Wfa3yn+axXni6+//LOq2w=;
	b=O4AEbieueZFS1VML4Gy73sXhtBu1BGe5WT2koUjtsfP7zsB7lJ9DpunN3ahqSirk8n
	VLd94oWRRQPDS1MJGydydIblxw50mNSgS7p3rQLBX4Z9y1ExUuqPzPVHkzKV9wlZFnM8
	Km1yINEdW8AQwESigF5pTPCtcA6y1IRrLetOrZohWCh3y12toJnUVDB2z8LYg3OqdMyT
	eLVLQU9uCcytf9ZO5vt06Np7/yLvRwMRjdsZ6OhU+Ys1GcEPzKpxeMzKsuB3s2IHiNKO
	CfllE4EuCXhMQGbCmZNeX4dWI72Lyv+BAQ7UK3E3ssrHX99ZjLjHl8MpSDiV35K1TzHe
	OrXw==
MIME-Version: 1.0
Received: by 10.112.98.197 with SMTP id ek5mr24304246lbb.80.1357560926848;
	Mon, 07 Jan 2013 04:15:26 -0800 (PST)
Received: by 10.112.137.229 with HTTP; Mon, 7 Jan 2013 04:15:26 -0800 (PST)
Date: Mon, 7 Jan 2013 17:45:26 +0530
Message-ID: <CAOkC3RaWqjHDNq6mp+Yv6iK-UdS73gyYAPqgG=5CBP7B23KwkA@mail.gmail.com>
From: GOPIKRISHNAN S <gopikrishnans@pec.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm0cY+sZPrP8r6OP5FBBBSXfudcZsKNfROLrgiZtsedxFZtn1INSSJvfZqPtGOl++8vKhtF
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Hiawatha error: conflicting types for 'something'
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
X-List-Received-Date: Mon, 07 Jan 2013 12:30:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am facing strange issue while building Hiawatha for Freescale P2041RDB.

I am getting some errors while building hiawatha(using recipe from
openembedded). In investigation I found all return \type and parameter type
seems to be same & in all /usr/include/*.h files in declared as extern was
added before to make it visible in global. I wonder no problem was
not raised while compiling for my host platform (Debian 6 on x86), and
getting problem only doing it for my freescale board

/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:39:5:
error: conflicting types for 'unsetenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:589:12:
note: previous declaration of 'unsetenv' was here
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:49:6:
error: conflicting types for 'clearenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:596:12:
note: previous declaration of 'clearenv' was here
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:39:5:
error: conflicting types for 'unsetenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:589:12:
note: previous declaration of 'unsetenv' was here
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:
In function
'strcasecmp':/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:49:6:
error: conflicting types for 'clearenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:596:12:
note: previous declaration of 'clearenv' was here


Does any have patch to fix this issue?


Reg,
Gopi Krishnan S

