Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JisjZ-0001he-1n
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 16:54:09 +0200
X-ASG-Debug-ID: 1207580047-4c0c00200000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 766213A287
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2008 09:54:07 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id G4CPimZuTJ5cuw6c for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 09:54:07 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Building multiple gdb-cross targets
Date: Mon, 7 Apr 2008 09:54:12 -0500
User-Agent: KMail/1.9.7
References: <200804041057.55738.geoffrey@pager.net>
	<47F66A0B.1000904@gmail.com>
	<200804041346.08584.geoffrey@pager.net>
In-Reply-To: <200804041346.08584.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200804070954.12162.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207580047
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Mon, 07 Apr 2008 14:54:09 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 04 April 2008 01:46:08 pm Geoffrey Wossum wrote:

> It was easy enough to build the bare metal debugger outside OE.  Just seems
> like you should be able to build this with OE, too.  It seems like it might
> need a separate .bb file to pull it off.  Not exactly sure how you'd force
> bitbake to use a different target setting.  Maybe setting the TARGET_OS to
> be blank in the bitbake file?

Copied gdb-cross_x.x.bb to gdb-baremetal_x.x.bb.  Added a line:
TARGET_SYS_avr32 = "avr32"

That actually seemed to work.

---
Geoffrey




