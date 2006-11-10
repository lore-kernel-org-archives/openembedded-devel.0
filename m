Received: from [213.4.149.66] (helo=ctsmtpout1.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GiV36-0002Ek-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Nov 2006 12:59:56 +0100
Received: from [194.179.62.51] (217.126.70.245) by ctsmtpout1.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 45420A740022F5AA for openembedded-devel@lists.openembedded.org;
	Fri, 10 Nov 2006 12:58:15 +0100
Message-ID: <455476DC.1030201@adtelecom.es>
Date: Fri, 10 Nov 2006 12:55:56 +0000
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Use of library glibc 2.4 for ARM
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
X-List-Received-Date: Fri, 10 Nov 2006 11:59:56 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

Few days ago, a commit had been done to allow the compilation of glibc 
3.4 for arm processors. However, the lines in .bb file that doesn't 
allow its compilation in ARM processors are included in the file. The 
lines are included bellow:

#add the hosts that are confirmed to be working to COMPATIBLE_HOSTi
COMPATIBLE_HOST = '(i.86.*-linux|sh.*-linux)'
DEFAULT_PREFERENCE_arm = "-1"

These lines could be updated or the library has still some issues to be 
compiled in an ARM processor?

Thanks in advance.

Joaquim Duran


