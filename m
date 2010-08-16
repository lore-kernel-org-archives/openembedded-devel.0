Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kousiklinux@gmail.com>) id 1OkuNM-00029p-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 09:45:08 +0200
Received: by qwi2 with SMTP id 2so4052802qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vnUX6iUPx8RdNbFGIoy6LVMQQmR1x41XlXdnSkbt1BY=;
	b=EH18jLGeIdBtiETmLT2KaLnipnHxqHyB50m1MPdQXFtASjkQixpCsUpQSzEw5ySKRf
	xPnaf6XgnuI07TNpTcibPdwf9bFXxFKXI27saNh09Beumv9LFQpba4uOVeU1Imfye2dM
	LD/qkdjNJ83nELSqE2K+zvV6iKfCmrHcq4Yos=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=u45mWh1Llo+j2QXTvFxE1OVK1JTmFblBxp2kRwmcOWX4kmrN1bcBNomVmqyJpmQn4k
	KvxqFmH5q+E2rOhmAWKdDwHxZgjO4042876IMQPZPFjL+NDtoF2D7CjVMNrgQ76xM1zt
	PoZsiTynR4WvxsXAxCGPaTSsj98vUJAshLiOE=
MIME-Version: 1.0
Received: by 10.224.5.199 with SMTP id 7mr3009744qaw.241.1281944679690; Mon,
	16 Aug 2010 00:44:39 -0700 (PDT)
Received: by 10.229.240.66 with HTTP; Mon, 16 Aug 2010 00:44:39 -0700 (PDT)
Date: Mon, 16 Aug 2010 13:14:39 +0530
Message-ID: <AANLkTi=immHiyS5p0WWmCYaii-5xBruCuBi3_jC_s5Pw@mail.gmail.com>
From: Kousik Maiti <kousiklinux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kousiklinux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Unable to build system
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
X-List-Received-Date: Mon, 16 Aug 2010 07:45:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi List,
I am new to openembeded.
I read the usermanual of openembeded. I configured my system as given in the
manual. But when I run
$ bitbake -b /home/kousikm/work/oe/openembedded/recipes/linux/
linux_2.6.34.bb

It gives the error:-

/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the sets
module is deprecated
  import types, sets
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}',
'BASE_PACKAGE_ARCH')}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${MACHINE_ARCH}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${PACKAGE_ARCH}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${WORKDIR}/${BP}
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal
(<string>, line 1) while evaluating:
${S}
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 140, in main
    cooker.cook()
  File "/var/lib/python-support/python2.6/bb/cooker.py", line 611, in cook
    if not self.buildFile(self.configuration.buildfile):
  File "/var/lib/python-support/python2.6/bb/cooker.py", line 479, in
buildFile
    self.bb_cache.loadData(fn, self.configuration.data)
  File "/var/lib/python-support/python2.6/bb/cache.py", line 170, in
loadData
    bb_data, skipped = self.load_bbfile(fn, cfgData)
  File "/var/lib/python-support/python2.6/bb/cache.py", line 407, in
load_bbfile
    bb_data = parse.handle(bbfile, bb_data) # read .bb data
  File "/var/lib/python-support/python2.6/bb/parse/__init__.py", line 75, in
handle
    return h['handle'](fn, data, include)
  File "/var/lib/python-support/python2.6/bb/parse/parse_py/BBHandler.py",
line 160, in handle
    build.exec_func("__anonfunc", d)
  File "/var/lib/python-support/python2.6/bb/build.py", line 98, in
exec_func
    adir = data.getVar('B', d, 1)
  File "/var/lib/python-support/python2.6/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 84, in
expand
    s = __expand_var_regexp__.sub(var_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 61, in
var_sub
    var = self.getVar(key, 1)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 167, in
getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 85, in
expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/var/lib/python-support/python2.6/bb/data_smart.py", line 71, in
python_sub
    s = eval(code)
  File "<string>", line 1
    oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE
                                                             ^
SyntaxError: EOL while scanning string literal


Can anybody help? I tried to resolve it by googleing. But failed.
Thanks in advanced.

With regards,
Kousik

