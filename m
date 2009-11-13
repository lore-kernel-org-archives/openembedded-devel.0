Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8tCJ-0000JM-TQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:16:11 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADABgrg015817 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 10:11:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mumLGcQBlks7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 10:11:42 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADABdHi015810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 10:11:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911130447260.1157@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
Date: Fri, 13 Nov 2009 10:09:58 +0000
Message-Id: <1258106998.5799.7.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: sqlite3_3.6.20
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
X-List-Received-Date: Fri, 13 Nov 2009 10:16:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-11-13 at 04:49 -0500, Robert P. J. Day wrote:
> NOTE: make -j4 sqlite3.h
> make: `sqlite3.h' is up to date.
> NOTE: make -j4
> rm -rf tsrc
> mkdir -p tsrc
> cp ./src/alter.c ./src/analyze.c ./src/attach.c ./src/auth.c ./src/backup=
.c ./src/bitvec.c ./src/btmutex.c ./src/btree.c ./src/btree.h ./src/btreeIn=
t.h ./src/build.c ./src/callback.c ./src/complete.c ./src/date.c ./src/dele=
te.c ./src/expr.c ./src/fault.c ./src/fkey.c ./src/func.c ./src/global.c ./=
src/hash.c ./src/hash.h ./src/hwtime.h ./src/insert.c ./src/journal.c ./src=
/legacy.c ./src/loadext.c ./src/main.c ./src/malloc.c ./src/mem0.c ./src/me=
m1.c ./src/mem2.c ./src/mem3.c ./src/mem5.c ./src/memjournal.c ./src/mutex.=
c ./src/mutex.h ./src/mutex_noop.c ./src/mutex_os2.c ./src/mutex_unix.c ./s=
rc/mutex_w32.c ./src/notify.c ./src/os.c ./src/os.h ./src/os_common.h ./src=
/os_os2.c ./src/os_unix.c ./src/os_win.c ./src/pager.c ./src/pager.h ./src/=
parse.y ./src/pcache.c ./src/pcache.h ./src/pcache1.c ./src/pragma.c ./src/=
prepare.c ./src/printf.c ./src/random.c ./src/resolve.c ./src/rowset.c ./sr=
c/select.c ./src/status.c ./src/shell.c ./src/sqlite.h.in ./src/sqlite3ext.=
h ./src/sqliteInt.h ./src/sqliteLimit.h ./src/table.c ./src/tclsqlite.c ./s=
rc/tokenize.c ./src/trigger.c ./src/utf.c ./src/update.c ./src/util.c ./src=
/vacuum.c ./src/vdbe.c ./src/vdbe.h ./src/vdbeapi.c ./src/vdbeaux.c ./src/v=
dbeblob.c ./src/vdbemem.c ./src/vdbeInt.h ./src/vtab.c ./src/walker.c ./src=
/where.c keywordhash.h opcodes.c opcodes.h parse.c parse.h config.h sqlite3=
.h ./ext/fts1/fts1.c ./ext/fts1/fts1.h ./ext/fts1/fts1_hash.c ./ext/fts1/ft=
s1_hash.h ./ext/fts1/fts1_porter.c ./ext/fts1/fts1_tokenizer.h ./ext/fts1/f=
ts1_tokenizer1.c ./ext/fts2/fts2.c ./ext/fts2/fts2.h ./ext/fts2/fts2_hash.c=
 ./ext/fts2/fts2_hash.h ./ext/fts2/fts2_icu.c ./ext/fts2/fts2_porter.c ./ex=
t/fts2/fts2_tokenizer.h ./ext/fts2/fts2_tokenizer.c ./ext/fts2/fts2_tokeniz=
er1.c ./ext/fts3/fts3.c ./ext/fts3/fts3.h ./ext/fts3/fts3_expr.c ./ext/fts3=
/fts3_expr.h ./ext/fts3/fts3_hash.c ./ext/fts3/fts3_hash.h ./ext/fts3/fts3_=
icu.c ./ext/fts3/fts3_porter.c ./ext/fts3/fts3_tokenizer.h ./ext/fts3/fts3_=
tokenizer.c ./ext/fts3/fts3_tokenizer1.c ./ext/icu/sqliteicu.h ./ext/icu/ic=
u.c ./ext/rtree/rtree.h ./ext/rtree/rtree.c tsrc
> rm tsrc/sqlite.h.in tsrc/parse.y
> tclsh8.4 ./tool/vdbe-compress.tcl <tsrc/vdbe.c >vdbe.new
> tclsh8.4: error while loading shared libraries: libtcl8.4.so.0: cannot op=
en shared object file: No such file or directory
> make: *** [.target_source] Error 127
> FATAL: oe_runmake failed

There is talk on irc of the symbolic link for libtcl8.4.so.0 not being
created. This should be done in the tcl-native recipe by the
oe_libinstall shell function call.

We're going to need someone who is experiencing this problem to find out
why that function is not creating the symlink...

(assuming the symlink is missing)

Cheers,

Richard



