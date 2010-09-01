Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Oqw37-0002wE-Vp
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 00:44:59 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Oqw2Y-0001yB-Fz from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 15:44:22 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 1 Sep 2010 15:44:22 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Sep 2010 16:44:21 -0600
Message-ID: <4C7ED741.7000801@mentor.com>
Date: Wed, 01 Sep 2010 15:44:17 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <10034543.559431283349469680.JavaMail.defaultUser@defaultHost>	<AANLkTi=U33a2xMK4SWWmF8c6hPi18vnedSaoTARuMwPn@mail.gmail.com>	<20100901192510.GA24544@denix.org>
	<AANLkTim=he3n7LUhmOJh2zJGJXymZvnv8kviGSAPnC3p@mail.gmail.com>
In-Reply-To: <AANLkTim=he3n7LUhmOJh2zJGJXymZvnv8kviGSAPnC3p@mail.gmail.com>
X-OriginalArrivalTime: 01 Sep 2010 22:44:21.0567 (UTC)
	FILETIME=[381B14F0:01CB4A27]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg vs dpkg/rpm
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
X-List-Received-Date: Wed, 01 Sep 2010 22:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> On 2 September 2010 04:55, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Wed, Sep 01, 2010 at 07:43:38AM -0700, Chris Larson wrote:
>>> In addition to package writing, there's the IMAGE_PKGTYPE varaible which
>>> controls which of the rootfs_<pkgtype> bbclasses is used to construct the
>>> root filesystem.  You can inherit multiple packaging formats, resulting in
>>> multiple formats being emitted, but one has to be selected specifically for
>>> the filesystem.  If you only inherit one packaging class (i.e. package_ipk)
>>> it will automatically set the image packaging type to match.  So, to switch:
>>>
>>> 1) INHERIT += "package_rpm"
>>> 2) IMAGE_PKGTYPE = "rpm"
>> Just a small clarification for Chris' excelent explanation - the change of the
>> above variables will require a complete rebuild/repackage of all the packages
>> and the filesystem image. And it's not possible to make the switch for an
>> existing image or add another package manager to an existing image w/o losing
>> the database of installed packages...
>>
>> --
>> Denys
> 
> It would be trivial to write a script to convert the package database
> from one package manager's format to another. Surely someone has
> already done this?

The big issue is converting the package files, although I suspect alien 
could be used here since it does .debs and ipk is a stripped down deb it 
might work, or might not, but could be made to work.

The bigger problem however is it's unclear if rpm or deb support is 
currently unbitrotten enough to work (deb stuff frequently has the 
problem that upstream upgraded, and we did not, so sources are gone).

-- 
Tom Rini
Mentor Graphics Corporation


