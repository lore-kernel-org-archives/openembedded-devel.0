Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Melze-0003Xr-Lw
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 10:30:34 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE00225347 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 10:13:04 +0200
Message-ID: <4A8FA88E.1050805@atmel.com>
Date: Sat, 22 Aug 2009 10:13:02 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D5E37.5010806@atmel.com>
	<b6ebd0a50908200826u31c28b11n81b92a08fd05d630@mail.gmail.com>
In-Reply-To: <b6ebd0a50908200826u31c28b11n81b92a08fd05d630@mail.gmail.com>
Subject: Re: Is it possible for a recipe to include/require something from a subdirectory?
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
X-List-Received-Date: Sat, 22 Aug 2009 08:30:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Chris Larson skrev:
> On Thu, Aug 20, 2009 at 7:31 AM, Ulf Samuelsson<ulf.samuelsson@atmel.com> wrote:
>> I just finished a nice gnome script which allows me to automatically
>> generate SRC_URI_append's
>>
>> I select the files[1-4] in <recipy-dir>/<recipy>/<xxx>/<yyy>",
>> and then run the script
>>
>> result is:
>>
>> SRC_URI_append_<board> = "\
>>        file://<file1>  \
>>        file://<file2>  \
>>        file://<file3>  \
>>        file://<file4>  \
>>        "
>>
>> Now, in <recipy-dir>/<recipy>.bb I want to include the file using
>>
>> require <xxx>/<yyy>/SRC_URI_append
>>
>> This did not work, so I tried symlinking - bad move...
>> I'd hate having to move it to the top directory of the recipe.
>>
>> Any ideas?
> 
> include/require obey BBPATH.  As far as I know, the parser should be
> temporarily changing bbpath to facilitate includes relative to the
> file doing the including.  If that isn't working, you could try
> require ${FILE_DIRNAME}/foo/bar instead.

That worked,
This saves me a lot of time.
I am thinking of checking in the script that generates the file.
Anyone interested?

Got as few other gnome scripts which I find useful.

1: Select <dir>; Copy <dir> to <dir>-0rig for creating a patch
2: Select <dir1> and <dir2>; diff -urN <dir1> <dir2>
3: Select <patch>.patch;
   splitdiff the patch into the directory <patch>/patchdir.
   Rename each <patch> to <patch>.patch
   If the file "template" is present:
	For each <string> (one per line) in template
	If a patch matches the string:
		create the <string> directory
		move all matching patches to this directory.
4: Select <source> and <patch-directory>
	The <patch-directory> is identified by having "./patchdir"
	"./patchdir contains a number of directories (patchsets).
	Attempt to apply all patches in the patch directory
	to the source tree using --dry-run.
	Provide OK/FAIL result + a list of all
	working patches are collected in a file.
5: Select a number of files; Generate SRC_URI_append.inc,
		optimized for the kernel
	It will check if a file "arch" exists and for
	each machine listed in "arch" it will check its subdirectory
	for a "defconfig", and will generate a
	SRC_URI_append_<arch>.inc, containing the stuff for each arch.
6: Select <file>; Set the execute bit on the <file>
7: Select <dir> <file>.patch; apply <patch>.patch to <dir>
	Report results


-- 
Best Regards
Ulf Samuelsson



