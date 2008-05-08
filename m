Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1Ju6pY-0005hN-UU
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 16:10:45 +0200
X-ASG-Debug-ID: 1210255784-119601120000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id BE6265852E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2008 09:09:44 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id xL8GHdVglNKfnl19 for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 09:09:44 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Creating a pristine environment?
Date: Thu, 8 May 2008 09:10:16 -0500
User-Agent: KMail/1.9.7
References: <200805080215.23729.zecke@selfish.org>
In-Reply-To: <200805080215.23729.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200805080910.16677.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1210255784
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 14:10:45 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 07 May 2008 07:15:23 pm Holger Freyther wrote:

> I have seen raster's environment breaking various buildsystems and we might
> want to really start having a clean environment before starting to build.
>
> the patch below should implement it. Should we do this in OE? I'm aware of
> the unexport inside OE but we really should do this the otherway around.

Using some variables from the users environment is good, as others have 
mentioned.  But some (I'm looking at you, CPATH) really need to be unset.  My 
Gentoo system automatically sets CPATH, and having that set results in "CROSS 
COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/libffi".  

---
Geoffrey





