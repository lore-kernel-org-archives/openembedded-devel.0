Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1LDf10-00088l-Ii
	for openembedded-devel@openembedded.org; Fri, 19 Dec 2008 14:03:38 +0100
Received: (qmail 28836 invoked from network); 19 Dec 2008 13:58:59 +0100
Received: from lusin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.141)
	by leibniz.math.fu-berlin.de with SMTP; 19 Dec 2008 13:58:59 +0100
Received: (qmail 18499 invoked by uid 9804); 19 Dec 2008 13:58:59 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 19 Dec 2008 13:58:48 +0100
Received: (qmail 18461 invoked by uid 9804); 19 Dec 2008 13:58:48 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by lusin.mi.fu-berlin.de with SMTP; 19 Dec 2008 13:58:48 +0100
Received: (qmail 28801 invoked from network); 19 Dec 2008 13:58:48 +0100
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	19 Dec 2008 12:58:48 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.63 #1
	(Debian)) id 1LDewJ-0006lK-Qj
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2008 13:58:47 +0100
Date: Fri, 19 Dec 2008 13:58:47 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081219125847.GA25947@mi.fu-berlin.de>
References: <494B4E6B.6010607@mgb-tech.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[18464](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <494B4E6B.6010607@mgb-tech.com>
User-Agent: Mutt/1.5.13 (2006-08-11)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: ARM - OE Linux, Java and SerialPort
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
X-List-Received-Date: Fri, 19 Dec 2008 13:03:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2008 at 08:34:03AM +0100, Jan Pannecoeck wrote:
> Hello everyone,
> 
> I'm not sure if this is the right mailinglist, but I'll post my question 
> here so maybe someone could help me. I'm currently using an OE linux 
> distribution on my ARM board, this is all working fine and I'm using 
> jamvm to run my java programs. Now I would like to communicate with a 
> SerialPort. But the Java Communication API provided by Sun does not 
> support an ARM based system. Only the Linux x86 system is supported. 
> Since Linux is using the serial port as a "file", the reading and 
> writing part could probably be done using a simple Reader and Writer in 
> Java, but how can I change the baudrate and other configuration settings 
> of the serial port?
> 
> Does anybody has any experience with this?
> 
> Kind regards, and a early happy christmas!
> 
> Jan Pannecoeck
> 

Try the rxtx package included in oe.

Bye Henning
-- 
IBM Certified Specialist - eserver i5 iSeries Technical Solutions Designer V5R3


