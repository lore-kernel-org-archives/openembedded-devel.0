Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OejOb-0004EX-VB for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 08:48:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OejOG-0003sS-BI for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 08:48:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:48:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:48:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 30 Jul 2010 08:48:11 +0200
Message-ID: <i2tsjb$o2v$1@dough.gmane.org>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
	<20100729205504.GE29814@mx.loc>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <20100729205504.GE29814@mx.loc>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Fri, 30 Jul 2010 06:48:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-07-10 22:55, Bernhard Reutner-Fischer wrote:
> On Thu, Jul 29, 2010 at 09:51:01AM -0500, Chase Maupin wrote:
>> * This class can be used to copy license files from package
>>  sources into the deploy directory so they can be distributed.
>> * By default it searches the top-level source directory for
>>  files matching COPYING* or LICENSE*
>> * Search depth and pattern can be modified using the
>>  LICENSE_SEARCH_DEPTH and LICENSE_FILES variables
>>  respectively.
>>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> ---
>> classes/distribute_license.bbclass |   56 ++++++++++++++++++++++++++++++++++++
>> 1 files changed, 56 insertions(+), 0 deletions(-)
>> create mode 100644 classes/distribute_license.bbclass
>>
>> diff --git a/classes/distribute_license.bbclass b/classes/distribute_license.bbclass
>> new file mode 100644
>> index 0000000..795a404
>> --- /dev/null
>> +++ b/classes/distribute_license.bbclass
>> @@ -0,0 +1,56 @@
>> +# distribute-license.bbclass will search the sources of a package to
>> +# a given depth looking for a match to the specified pattern and if
>> +# found will copy the matching file(s) to the deploy directory.
>> +#
>> +# This class is used to collect license files such as COPYING or
>> +# LICENSE where they are found and save them per package.
>> +#
>> +# This package uses the following variables to control its operations:
>> +#   - LICENSE_FILES         = Pattern of license files to be searched for.
>> +#                             By default this is COPYING* and LICENSE* but
>> +#                             this can be changed per package.
>> +#   - LICENSE_SEARCH_DEPTH  = The maximum depth to search in the package
>> +#                             sources for files matching the LICENSE_FILES
>> +#                             pattern.
>> +
>> +
>> +# Files to copy for the licensing.  By default this is looking for
>> +# files following the patters COPYING* or LICENSING* in the top
>> +# level sources directory.
>> +LICENSE_FILES ?= "COPYING* LICENSE*"
>> +
>> +# Maximum depth to look for license files
>> +LICENSE_SEARCH_DEPTH ?= "1"
>> +
>> +distribute_license_do_copy_license() {
>> +    # Change directory to source directory
>> +    cd ${S}
>> +
>> +    # Turn of globbing so that wildcards are not expanded in for loop
> 
> /s/of/off/
> 
>> +    set -f
> 
> hush: set: -f: invalid option

I don't think we realistically support something different than bash.
Having said that, adding hashisms is bad, do you have a suggestion for a
more portable approach?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUnWrMkyGM64RGpERAi/2AKCGmm0kgEu54YytOloQwn5r54WH/ACfbw2+
4wUfIALobrMrVMin2tcloyU=
=wG8e
-----END PGP SIGNATURE-----



