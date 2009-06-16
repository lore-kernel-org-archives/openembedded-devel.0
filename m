Received: from [17.148.16.92] (helo=asmtpout017.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGe3l-0007vB-AZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 21:11:05 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp017.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLC00B9MI51TM60@asmtp017.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 12:00:41 -0700 (PDT)
Message-id: <5583158E-0DDA-4F67-AC22-112DA722C877@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <4A37E699.6050408@balister.org>
Date: Tue, 16 Jun 2009 23:00:26 +0400
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h18o6n$oos$2@ger.gmane.org> <4A37E699.6050408@balister.org>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Tue, 16 Jun 2009 19:11:05 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	If we use

inherit autotools_stage pkgconfig

it will install the header files into ${STAGING_INCDIR}. So just to  
keep it neat and organized, Justin and myself thought it best that we  
put it in a subfolder  ${STAGING_INCDIR}/fann, just to keep things  
organized.

You can call it from the code as #include <fann.h> if  you use  
autotools_stage, or if you create the do_stage() method, an ensure  
that the fann library headers get put in the ${STAGING_INCDIR}/fann,  
called it from the code as #include <fann/fann.h>

Elvis




