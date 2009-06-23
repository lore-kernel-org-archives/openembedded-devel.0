Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJFnn-00088f-AB
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 01:53:23 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLP006X6TU7CFI2@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Jun 2009 18:42:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B13714AF5F; Tue,
	23 Jun 2009 19:42:07 -0400 (EDT)
Date: Tue, 23 Jun 2009 19:42:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623234207.GH32082@denix.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-7-git-send-email-marcin@juszkiewicz.com.pl>
	<h1q6gb$a5v$16@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1q6gb$a5v$16@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 046/125] Shorten some full paths printed	to the user.
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
X-List-Received-Date: Tue, 23 Jun 2009 23:53:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 23, 2009 at 11:15:55AM +0200, Koen Kooi wrote:
> On 23-06-09 10:56, Marcin Juszkiewicz wrote:
>> From: Chris Larson<clarson@mvista.com>
>>
>> Adds a base_path_out convenience function, which prepares a full path for
>> display to the user.  The initial implementation just makes it relative to
>> ${TOPDIR}.  This function is then used for some messages outputted to the
>> user (packaged-staging, patch application, clean, unpack tasks).
>>
>> Signed-off-by: Chris Larson<clarson@mvista.com>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   classes/base.bbclass             |   17 +++++++++++++----
>>   classes/packaged-staging.bbclass |    2 +-
>>   classes/patch.bbclass            |    2 +-
>>   3 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 3d4a426..e622aee 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -39,6 +39,14 @@ def base_path_relative(src, dest):
>>
>>       return sep.join(relpath)
>>
>> +def base_path_out(path, d):
>> +    """ Prepare a path for display to the user. """
>> +    rel = base_path_relative(d.getVar("TOPDIR", 1), path)
>> +    if len(rel)>  len(path):
>> +        return path
>> +    else:
>> +        return rel
>> +
>>   # for MD5/SHA handling
>>   def base_chk_load_parser(config_paths):
>>       import ConfigParser, os, bb
>> @@ -69,6 +77,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, 
>> data):
>>
>>       # md5 and sha256 should be valid now
>>       if not os.path.exists(localpath):
>> +        localpath = base_path_out(localpath, data)
>>           bb.note("The localpath does not exist '%s'" % localpath)
>>           raise Exception("The path does not exist '%s'" % localpath)
>>
>> @@ -497,11 +506,11 @@ python base_do_clean() {
>>   	"""clear the build and temp directories"""
>>   	dir = bb.data.expand("${WORKDIR}", d)
>>   	if dir == '//': raise bb.build.FuncFailed("wrong DATADIR")
>> -	bb.note("removing " + dir)
>> +	bb.note("removing " + base_path_out(dir, d))
>>   	os.system('rm -rf ' + dir)
>>
>>   	dir = "%s.*" % bb.data.expand(bb.data.getVar('STAMP', d), d)
>> -	bb.note("removing " + dir)
>> +	bb.note("removing " + base_path_out(dir, d))
>>   	os.system('rm -f '+ dir)
>>   }
>>
>> @@ -556,7 +565,7 @@ python base_do_distclean() {
>>   		except bb.MalformedUrl, e:
>>   			bb.debug(1, 'Unable to generate local path for malformed uri: %s' % 
>> e)
>>   		else:
>> -			bb.note("removing %s" % local)
>> +			bb.note("removing %s" % base_path_out(local, d))
>>   			try:
>>   				if os.path.exists(local + ".md5"):
>>   					os.remove(local + ".md5")
>> @@ -777,7 +786,7 @@ def oe_unpack_file(file, data, url = None):
>>   		os.chdir(newdir)
>>
>>   	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
>> -	bb.note("Unpacking %s to %s/" % (file, os.getcwd()))
>> +	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), 
>> base_path_out(os.getcwd(), data)))
>>   	ret = os.system(cmd)
>>
>>   	os.chdir(save_cwd)
>> diff --git a/classes/packaged-staging.bbclass 
>> b/classes/packaged-staging.bbclass
>> index 82c1a0d..bd7b9ea 100644
>> --- a/classes/packaged-staging.bbclass
>> +++ b/classes/packaged-staging.bbclass
>> @@ -135,7 +135,7 @@ do_clean_prepend() {
>>   	pstage_cleanpackage(removepkg, d)
>>
>>   	stagepkg = bb.data.expand("${PSTAGE_PKG}", d)
>> -	bb.note("Removing staging package %s" % stagepkg)
>> +	bb.note("Removing staging package %s" % base_path_out(stagepkg, d))
>>   	os.system('rm -rf ' + stagepkg)
>>   }
>>
>> diff --git a/classes/patch.bbclass b/classes/patch.bbclass
>> index 8d2bde0..2f99e4c 100644
>> --- a/classes/patch.bbclass
>> +++ b/classes/patch.bbclass
>> @@ -527,7 +527,7 @@ python patch_do_patch() {
>>   				bb.note("Patch '%s' applies to earlier revisions" % pname)
>>   				continue
>>
>> -		bb.note("Applying patch '%s' (%s)" % (pname, unpacked))
>> +		bb.note("Applying patch '%s' (%s)" % (pname, base_path_out(unpacked, 
>> d)))
>>   		try:
>>   			patchset.Import({"file":unpacked, "remote":url, "strippath": pnum}, 
>> True)
>>   		except:
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


