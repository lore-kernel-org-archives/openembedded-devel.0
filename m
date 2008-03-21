Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1Jcjhn-00075M-FP
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 17:02:55 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1685110wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 09:02:50 -0700 (PDT)
Received: by 10.141.179.5 with SMTP id g5mr1390827rvp.18.1206115369604;
	Fri, 21 Mar 2008 09:02:49 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id i6sm65090wxd.21.2008.03.21.09.02.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Mar 2008 09:02:38 -0700 (PDT)
Message-ID: <47E3DBFD.7050609@gmail.com>
Date: Fri, 21 Mar 2008 11:02:05 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47E3C6F7.8030902@gmail.com> <200803211646.29107.zecke@selfish.org>
In-Reply-To: <200803211646.29107.zecke@selfish.org>
Subject: Re: RPROVIDES problem for kdepimpi
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
X-List-Received-Date: Fri, 21 Mar 2008 16:02:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2008 10:46 AM, Holger Freyther wrote:
> On Friday 21 March 2008 15:32:23 Junqian Gordon Xu wrote:
>> Similar to the tzdata problem. kdepimpi recipe does not define a package
>> ${PN}, and bitbake doesn't like the fact that ${PN} is missing in
>> RPROVIDES.
> 
> Where is the issue? Why should there be a RPROVIDES=kdepimpi?

bitbake kdepimpi

ERROR: 
'['/home/gordon/oe/org.openembedded.dev/packages/kdepimpi/kdepimpi_2.2.7.bb']' 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'kdepimpi' 
but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'kdepimpi' is unbuildable, removing...

Regards
Gordon


