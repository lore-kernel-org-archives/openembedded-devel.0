Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Lc3x2-0003wA-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 21:32:24 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id 26773182C5F86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 21:29:25 +0100 (CET)
Message-ID: <49A458A1.80308@opensimpad.org>
Date: Tue, 24 Feb 2009 21:29:21 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200902131728.08634.openembedded@haerwu.biz>
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz>
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 20:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Other was to use filename as key and add "url[0-xx]" fields which will 
> list alternative locations. This one looks better but still does not 
> solve situation when someone use DEBIAN_MIRROR which is not present in 
> checksums.ini file.
>
>   
What about using the hashes as identifier:

Something like this:

filename=foo-0.13.49.tar.bz2
url[0-xx]
generated_url[0-xx] //or only [0-xx]
md5=5f7b88ebb2bcd7e8044328482d079661
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

pseudo code:
download source
check_ok:=false

if SRC_URI exists in url/generated_url + filename
    do normal check
else
    generate md5 and sha256 sums of the source
    look up md5 and sha256 sum
    if both exists in the same entity
       if filename matches filename of SRC_URI
          check_ok:=true
          add url to generated_urls

best regards
Bernhard Guillon


