Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NYfI4-0008CA-08
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 13:40:39 +0100
MIME-version: 1.0
Received: from [87.201.169.253] by asmtp027.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWP00GA19RMVL20@asmtp027.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	23 Jan 2010 04:38:14 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001230058
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sat, 23 Jan 2010 16:38:08 +0400
In-reply-to: <C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
To: openembedded-devel@lists.openembedded.org
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
	<4B55FC07.3080504@paulwilsonconsulting.com>
	<C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
Message-id: <BD272887-5F72-4B99-B9E9-0C8D1451426F@mac.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.102
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Sat, 23 Jan 2010 12:40:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,
       I found the solution for this. I was using the older svn repository, and bitbake is now being maintained using the git repository, which has the latest updates.

Switching to the git version of the bitbake repository helped remove the error, and the build has now commenced! :-)

$ git clone git://git.openembedded.org/bitbake.git
$ cd bitbake
$ git checkout -b 1.8 --track origin/1.8
$ cd ..

Best regards,

Elvis Dowson

