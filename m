Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNJVW-0003sV-Fx
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 06:11:37 +0100
Received: by gxk7 with SMTP id 7so14792243gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 21:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:from:organization:message-id:user-agent;
	bh=/jfLsgdeq0kjBJzh3sAlCNpbmsfd4gLbegHjGSzLUxY=;
	b=V3AVvyY89RONoV7fmsSuT7Ke/XgkclVwzy9+QwilSwQWEnNKkoN6TudIz/sLgdOl2+
	DJ7lGvIXV1uUAhzxmmB8TqtyyIV+Go+l2qJsjBBc8ezlgnHPjF363AOnq5Vcu4GZMgpy
	INM4c4jfh6N6lwLOmrd80hSffD+VfOIN53QMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:from:organization
	:message-id:user-agent;
	b=urmsz4/1G28+htglPqZJ2LQnet4vGS03QE5p2ik3ec9+SKvEYm70rs7UAH4B3cAZ1i
	ajZlF6POzKfs8gpIMLHNKgemYMU0EViRej+nQBWLNsZbWGnsCOYGX13JdltI+iHkUCPw
	sBcmDf5tP8BecV5Lducod+nu9uWQAyP7hQqBM=
Received: by 10.90.41.31 with SMTP id o31mr355600ago.80.1261544981444;
	Tue, 22 Dec 2009 21:09:41 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.196])
	by mx.google.com with ESMTPS id 22sm6054354iwn.4.2009.12.22.21.09.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Dec 2009 21:09:40 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Dec 2009 13:09:23 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5dklxm5mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Compiling glibc-2.6.1 failed
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
X-List-Received-Date: Wed, 23 Dec 2009 05:11:38 -0000
X-Groupsio-MsgNum: 15196
Content-Type: multipart/mixed; boundary=----------X7YEVu3Bb1URzuJLJSPjfX

------------X7YEVu3Bb1URzuJLJSPjfX
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
     When compiling glibc,  I meet the following error information. You can  
reproduce it as the following:
DISTRO = "minimal"
MACHINE = "qemux86"
bitbake helloworld-image

    By the way, when using eglibc, it works OK.  Anyone can give me some  
hints?

Thanks a lot.

| checking whether  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld  
is GNU ld... yes
| checking for  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/as...  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/as
| checking version of  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/as...  
2.20, bad
| checking for  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld...  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld
| checking version of  
/media/work-disk/workdir/oe-mini-glibc-bug/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld...  
2.20, bad
| checking for pwd...  
/media/work-disk/workdir/oe-mini-glibc-bug/staging/i686-linux/usr/bin/pwd
| checking for i686-oe-linux-gcc... (cached) ccache i686-oe-linux-gcc  
-march=pentiumpro
| checking version of ccache i686-oe-linux-gcc -march=pentiumpro... 4.4.2,  
ok
| checking for gnumake... make
| checking version of make... 3.81, ok
| checking for gnumsgfmt... no
| checking for gmsgfmt... no
| checking for msgfmt... msgfmt
| checking version of msgfmt... 0.17, ok
| checking for makeinfo... makeinfo
| checking version of makeinfo... 4.11, ok
| checking for sed... sed
| checking version of sed... 4.1.5, ok
| checking for autoconf... autoconf
| checking whether autoconf works... yes
| configure: error:
| *** These critical programs are missing or too old: as ld
| *** Check the INSTALL file for required versions.
| FATAL: oe_runconf failed



-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com

------------X7YEVu3Bb1URzuJLJSPjfX
Content-Disposition: attachment; filename=log.do_configure.25793
Content-Type: application/octet-stream; name=log.do_configure.25793
Content-Transfer-Encoding: Base64

Tk9URTogUnVubmluZyAvbWVkaWEvd29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcv
d29yay9pNjg2LW9lLWxpbnV4L2dsaWJjLTIuNi4xLXIzNS4wL2dsaWJjLTIuNi4xL2NvbmZpZ3Vy
ZSAJCSAgICAtLWJ1aWxkPWk2ODYtbGludXggCQkgICAgLS1ob3N0PWk2ODYtb2UtbGludXggCQkg
ICAgLS10YXJnZXQ9aTY4Ni1vZS1saW51eCAJCSAgICAtLXByZWZpeD0vdXNyIAkJICAgIC0tZXhl
Y19wcmVmaXg9L3VzciAJCSAgICAtLWJpbmRpcj0vdXNyL2JpbiAJCSAgICAtLXNiaW5kaXI9L3Vz
ci9zYmluIAkJICAgIC0tbGliZXhlY2Rpcj0vdXNyL2xpYmV4ZWMgCQkgICAgLS1kYXRhZGlyPS91
c3Ivc2hhcmUgCQkgICAgLS1zeXNjb25mZGlyPS9ldGMgCQkgICAgLS1zaGFyZWRzdGF0ZWRpcj0v
Y29tIAkJICAgIC0tbG9jYWxzdGF0ZWRpcj0vdmFyIAkJICAgIC0tbGliZGlyPS91c3IvbGliIAkJ
ICAgIC0taW5jbHVkZWRpcj0vdXNyL2luY2x1ZGUgCQkgICAgLS1vbGRpbmNsdWRlZGlyPS91c3Iv
aW5jbHVkZSAJCSAgICAtLWluZm9kaXI9L3Vzci9zaGFyZS9pbmZvIAkJICAgIC0tbWFuZGlyPS91
c3Ivc2hhcmUvbWFuIAkJCSAgLS1lbmFibGUta2VybmVsPTIuNC4wICAgLS13aXRob3V0LWN2cyAt
LWRpc2FibGUtcHJvZmlsZSAtLWRpc2FibGUtZGVidWcgLS13aXRob3V0LWdkICAgLS1lbmFibGUt
Y2xvY2FsZT1nbnUgICAtLWVuYWJsZS1hZGQtb25zPW5wdGwgICAtLXdpdGgtaGVhZGVycz0vbWVk
aWEvd29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcvc3RhZ2luZy9pNjg2LW9lLWxp
bnV4L3Vzci9pbmNsdWRlICAgLS13aXRob3V0LXNlbGludXggICAtLXdpdGgtdGxzICAgIAkJICAg
IC4uLgpjb25maWd1cmU6IGxvYWRpbmcgc2l0ZSBzY3JpcHQgL29wdC93b3JrZGlyL29lL29wZW5l
bWJlZGRlZC9zaXRlL2VuZGlhbi1saXR0bGUKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0
IC9vcHQvd29ya2Rpci9vZS9vcGVuZW1iZWRkZWQvc2l0ZS9jb21tb24tbGludXgKY29uZmlndXJl
OiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9vcHQvd29ya2Rpci9vZS9vcGVuZW1iZWRkZWQvc2l0ZS9j
b21tb24tZ2xpYmMKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9vcHQvd29ya2Rpci9v
ZS9vcGVuZW1iZWRkZWQvc2l0ZS9peDg2LWNvbW1vbgpjb25maWd1cmU6IGxvYWRpbmcgc2l0ZSBz
Y3JpcHQgL29wdC93b3JrZGlyL29lL29wZW5lbWJlZGRlZC9zaXRlL2NvbW1vbgpjb25maWd1cmU6
IGxvYWRpbmcgc2l0ZSBzY3JpcHQgL29wdC93b3JrZGlyL29lL29wZW5lbWJlZGRlZC9zaXRlL2Nv
bW1vbgpjaGVja2luZyBidWlsZCBzeXN0ZW0gdHlwZS4uLiBpNjg2LXBjLWxpbnV4LWdudQpjaGVj
a2luZyBob3N0IHN5c3RlbSB0eXBlLi4uIGk2ODYtb2UtbGludXgtZ251CmNvbmZpZ3VyZTogcnVu
bmluZyBjb25maWd1cmUgZnJhZ21lbnQgZm9yIGFkZC1vbiBucHRsCmNoZWNraW5nIHN5c2RlcCBk
aXJzLi4uIHN5c2RlcHMvaTM4Ni9lbGYgbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9pMzg2
L2k2ODYgbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9pMzg2IHN5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L2kzODYgbnB0bC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eCBucHRsL3N5c2RlcHMvcHRo
cmVhZCBzeXNkZXBzL3B0aHJlYWQgc3lzZGVwcy91bml4L3N5c3YvbGludXggc3lzZGVwcy9nbnUg
c3lzZGVwcy91bml4L2NvbW1vbiBzeXNkZXBzL3VuaXgvbW1hbiBzeXNkZXBzL3VuaXgvaW5ldCBz
eXNkZXBzL3VuaXgvc3lzdi9pMzg2IG5wdGwvc3lzZGVwcy91bml4L3N5c3Ygc3lzZGVwcy91bml4
L3N5c3Ygc3lzZGVwcy91bml4L2kzODYgbnB0bC9zeXNkZXBzL3VuaXggc3lzZGVwcy91bml4IHN5
c2RlcHMvcG9zaXggc3lzZGVwcy9pMzg2L2k2ODYvZnB1IG5wdGwvc3lzZGVwcy9pMzg2L2k2ODYg
c3lzZGVwcy9pMzg2L2k2ODYgc3lzZGVwcy9pMzg2L2k0ODYgbnB0bC9zeXNkZXBzL2kzODYvaTQ4
NiBzeXNkZXBzL2kzODYvZnB1IG5wdGwvc3lzZGVwcy9pMzg2IHN5c2RlcHMvaTM4NiBzeXNkZXBz
L3dvcmRzaXplLTMyIHN5c2RlcHMvaWVlZTc1NC9sZGJsLTk2IHN5c2RlcHMvaWVlZTc1NC9kYmwt
NjQgc3lzZGVwcy9pZWVlNzU0L2ZsdC0zMiBzeXNkZXBzL2llZWU3NTQgc3lzZGVwcy9nZW5lcmlj
L2VsZiBzeXNkZXBzL2dlbmVyaWMKY2hlY2tpbmcgZm9yIGEgQlNELWNvbXBhdGlibGUgaW5zdGFs
bC4uLiAvbWVkaWEvd29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcvc3RhZ2luZy9p
Njg2LWxpbnV4L3Vzci9iaW4vaW5zdGFsbCAtYwpjaGVja2luZyB3aGV0aGVyIGxuIC1zIHdvcmtz
Li4uIHllcwpjaGVja2luZyBmb3IgaTY4Ni1vZS1saW51eC1nY2MuLi4gY2NhY2hlIGk2ODYtb2Ut
bGludXgtZ2NjIC1tYXJjaD1wZW50aXVtcHJvCmNoZWNraW5nIGZvciBzdWZmaXggb2Ygb2JqZWN0
IGZpbGVzLi4uIG8KY2hlY2tpbmcgd2hldGhlciB3ZSBhcmUgdXNpbmcgdGhlIEdOVSBDIGNvbXBp
bGVyLi4uIHllcwpjaGVja2luZyB3aGV0aGVyIGNjYWNoZSBpNjg2LW9lLWxpbnV4LWdjYyAtbWFy
Y2g9cGVudGl1bXBybyBhY2NlcHRzIC1nLi4uIHllcwpjaGVja2luZyBmb3IgY2NhY2hlIGk2ODYt
b2UtbGludXgtZ2NjIC1tYXJjaD1wZW50aXVtcHJvIG9wdGlvbiB0byBhY2NlcHQgQU5TSSBDLi4u
IG5vbmUgbmVlZGVkCmNoZWNraW5nIGZvciBnY2MuLi4gY2NhY2hlIGdjYwpjaGVja2luZyBob3cg
dG8gcnVuIHRoZSBDIHByZXByb2Nlc3Nvci4uLiBpNjg2LW9lLWxpbnV4LWdjYyAtRQpjaGVja2lu
ZyBmb3IgaTY4Ni1vZS1saW51eC1nKysuLi4gY2NhY2hlIGk2ODYtb2UtbGludXgtZysrIC1tYXJj
aD1wZW50aXVtcHJvCmNoZWNraW5nIHdoZXRoZXIgd2UgYXJlIHVzaW5nIHRoZSBHTlUgQysrIGNv
bXBpbGVyLi4uIG5vCmNoZWNraW5nIHdoZXRoZXIgY2NhY2hlIGk2ODYtb2UtbGludXgtZysrIC1t
YXJjaD1wZW50aXVtcHJvIGFjY2VwdHMgLWcuLi4gbm8KY2hlY2tpbmcgd2hldGhlciAvbWVkaWEv
d29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcvY3Jvc3MvaTY4Ni9saWIvZ2NjL2k2
ODYtb2UtbGludXgvNC40LjIvLi4vLi4vLi4vLi4vaTY4Ni1vZS1saW51eC9iaW4vYXMgaXMgR05V
IGFzLi4uIHllcwpjaGVja2luZyB3aGV0aGVyIC9tZWRpYS93b3JrLWRpc2svd29ya2Rpci9vZS1t
aW5pLWdsaWJjLWJ1Zy9jcm9zcy9pNjg2L2xpYi9nY2MvaTY4Ni1vZS1saW51eC80LjQuMi8uLi8u
Li8uLi8uLi9pNjg2LW9lLWxpbnV4L2Jpbi9sZCBpcyBHTlUgbGQuLi4geWVzCmNoZWNraW5nIGZv
ciAvbWVkaWEvd29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcvY3Jvc3MvaTY4Ni9s
aWIvZ2NjL2k2ODYtb2UtbGludXgvNC40LjIvLi4vLi4vLi4vLi4vaTY4Ni1vZS1saW51eC9iaW4v
YXMuLi4gL21lZGlhL3dvcmstZGlzay93b3JrZGlyL29lLW1pbmktZ2xpYmMtYnVnL2Nyb3NzL2k2
ODYvbGliL2djYy9pNjg2LW9lLWxpbnV4LzQuNC4yLy4uLy4uLy4uLy4uL2k2ODYtb2UtbGludXgv
YmluL2FzCmNoZWNraW5nIHZlcnNpb24gb2YgL21lZGlhL3dvcmstZGlzay93b3JrZGlyL29lLW1p
bmktZ2xpYmMtYnVnL2Nyb3NzL2k2ODYvbGliL2djYy9pNjg2LW9lLWxpbnV4LzQuNC4yLy4uLy4u
Ly4uLy4uL2k2ODYtb2UtbGludXgvYmluL2FzLi4uIDIuMjAsIGJhZApjaGVja2luZyBmb3IgL21l
ZGlhL3dvcmstZGlzay93b3JrZGlyL29lLW1pbmktZ2xpYmMtYnVnL2Nyb3NzL2k2ODYvbGliL2dj
Yy9pNjg2LW9lLWxpbnV4LzQuNC4yLy4uLy4uLy4uLy4uL2k2ODYtb2UtbGludXgvYmluL2xkLi4u
IC9tZWRpYS93b3JrLWRpc2svd29ya2Rpci9vZS1taW5pLWdsaWJjLWJ1Zy9jcm9zcy9pNjg2L2xp
Yi9nY2MvaTY4Ni1vZS1saW51eC80LjQuMi8uLi8uLi8uLi8uLi9pNjg2LW9lLWxpbnV4L2Jpbi9s
ZApjaGVja2luZyB2ZXJzaW9uIG9mIC9tZWRpYS93b3JrLWRpc2svd29ya2Rpci9vZS1taW5pLWds
aWJjLWJ1Zy9jcm9zcy9pNjg2L2xpYi9nY2MvaTY4Ni1vZS1saW51eC80LjQuMi8uLi8uLi8uLi8u
Li9pNjg2LW9lLWxpbnV4L2Jpbi9sZC4uLiAyLjIwLCBiYWQKY2hlY2tpbmcgZm9yIHB3ZC4uLiAv
bWVkaWEvd29yay1kaXNrL3dvcmtkaXIvb2UtbWluaS1nbGliYy1idWcvc3RhZ2luZy9pNjg2LWxp
bnV4L3Vzci9iaW4vcHdkCmNoZWNraW5nIGZvciBpNjg2LW9lLWxpbnV4LWdjYy4uLiAoY2FjaGVk
KSBjY2FjaGUgaTY4Ni1vZS1saW51eC1nY2MgLW1hcmNoPXBlbnRpdW1wcm8KY2hlY2tpbmcgdmVy
c2lvbiBvZiBjY2FjaGUgaTY4Ni1vZS1saW51eC1nY2MgLW1hcmNoPXBlbnRpdW1wcm8uLi4gNC40
LjIsIG9rCmNoZWNraW5nIGZvciBnbnVtYWtlLi4uIG1ha2UKY2hlY2tpbmcgdmVyc2lvbiBvZiBt
YWtlLi4uIDMuODEsIG9rCmNoZWNraW5nIGZvciBnbnVtc2dmbXQuLi4gbm8KY2hlY2tpbmcgZm9y
IGdtc2dmbXQuLi4gbm8KY2hlY2tpbmcgZm9yIG1zZ2ZtdC4uLiBtc2dmbXQKY2hlY2tpbmcgdmVy
c2lvbiBvZiBtc2dmbXQuLi4gMC4xNywgb2sKY2hlY2tpbmcgZm9yIG1ha2VpbmZvLi4uIG1ha2Vp
bmZvCmNoZWNraW5nIHZlcnNpb24gb2YgbWFrZWluZm8uLi4gNC4xMSwgb2sKY2hlY2tpbmcgZm9y
IHNlZC4uLiBzZWQKY2hlY2tpbmcgdmVyc2lvbiBvZiBzZWQuLi4gNC4xLjUsIG9rCmNoZWNraW5n
IGZvciBhdXRvY29uZi4uLiBhdXRvY29uZgpjaGVja2luZyB3aGV0aGVyIGF1dG9jb25mIHdvcmtz
Li4uIHllcwpjb25maWd1cmU6IGVycm9yOgoqKiogVGhlc2UgY3JpdGljYWwgcHJvZ3JhbXMgYXJl
IG1pc3Npbmcgb3IgdG9vIG9sZDogYXMgbGQKKioqIENoZWNrIHRoZSBJTlNUQUxMIGZpbGUgZm9y
IHJlcXVpcmVkIHZlcnNpb25zLgpGQVRBTDogb2VfcnVuY29uZiBmYWlsZWQK

------------X7YEVu3Bb1URzuJLJSPjfX--
