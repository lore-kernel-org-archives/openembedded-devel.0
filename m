Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TtL9I-0004Nd-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 17:38:38 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm2so444029wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=0QU2G23oUotCNKTpeheOmgqWbMTtCoiOsLxCOUANkgI=;
	b=tlGX1fRN2wa3hY0/GkRHjEk/zUCBpciCki+7eI6IuGJq0FSZPrcrgvDR59C1rVPCHn
	iIE+DOlFFOrRwt6z6wUDVWl/5xgWs/snueTs+oL4aO4cx7d90MwIdrNuihn6LO4Ln9sY
	AUl2XXN500icO9GcCeXm6sV/LKOV2GEz/cBB850xA1TERwQKrnKfQoA7EU0SfT+SLLmt
	z//LmnZMHv+MgQ4XE/vsvWh+FvfK54Mw/9R1PvAMRXvJ1Lu05F40+GTouFgAfOozTail
	r8/QCfJmF3mYxV5QERD3L/Eli+4Qmq0OBnx4X50BSsbQ21qIDUFoO868S4SeKsF5aulZ
	Y6/Q==
X-Received: by 10.180.78.137 with SMTP id b9mr10216266wix.30.1357835002706;
	Thu, 10 Jan 2013 08:23:22 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id g2sm3028792wiy.0.2013.01.10.08.23.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 08:23:21 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 21:22:38 +0500
Message-Id: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Otavio Salvador <otavio@ossystems.com.br>, Eric Benard <eric@eukrea.com>
Subject: [meta-browser][PATCH 1/2] chromium: fix webkit build with newer bison
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
X-List-Received-Date: Thu, 10 Jan 2013 16:38:38 -0000

the chromium tarball contains its own copy of webkit sources and it fails to
build with bison-2.6 or later. Martin Jansa submitted a fix for this
problem in webkit-gtk recipei in poky,
commit id=4b5705c426743e812d6da25ff37c335e073bfb12

We need to apply the same fix here as well

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes-browser/chromium/chromium/bison-2.6.patch |  558 +++++++++++++++++++++
 recipes-browser/chromium/chromium_19.0.1049.3.bb  |    3 +-
 2 files changed, 560 insertions(+), 1 deletion(-)
 create mode 100644 recipes-browser/chromium/chromium/bison-2.6.patch

diff --git a/recipes-browser/chromium/chromium/bison-2.6.patch b/recipes-browser/chromium/chromium/bison-2.6.patch
new file mode 100644
index 0000000..b327e60
--- /dev/null
+++ b/recipes-browser/chromium/chromium/bison-2.6.patch
@@ -0,0 +1,558 @@
+Upstream-Status: Backport
+http://trac.webkit.org/changeset/124099
+
+Subversion Revision: 123651
+diff --git a/third_party/WebKit/Source/WebCore/css/CSSGrammar.y b/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
+index c7c10b541cd46ad4febc6efe289e81b2cfb0861e..1c604e76b4da4cc65f395bc4a73b112561bd5c84 100644
+--- a/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
++++ b/third_party/WebKit/Source/WebCore/css/CSSGrammar.y
+@@ -53,14 +53,13 @@ using namespace HTMLNames;
+ #define YYMAXDEPTH 10000
+ #define YYDEBUG 0
+ 
+-// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
+-#define YYPARSE_PARAM parser
+-#define YYLEX_PARAM parser
+-
+ %}
+ 
+ %pure_parser
+ 
++%parse-param { CSSParser* parser }
++%lex-param { CSSParser* parser }
++
+ %union {
+     bool boolean;
+     char character;
+@@ -89,7 +88,7 @@ using namespace HTMLNames;
+ 
+ %{
+ 
+-static inline int cssyyerror(const char*)
++static inline int cssyyerror(void*, const char*)
+ {
+     return 1;
+ }
+diff --git a/third_party/WebKit/Source/WebCore/css/CSSParser.cpp b/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
+index 650844060477cfc6ea6fdeaf11ec63b34ac646e7..8369549dbff25537cf93a11237a9bbbac4fe50f2 100644
+--- a/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
++++ b/third_party/WebKit/Source/WebCore/css/CSSParser.cpp
+@@ -114,7 +114,7 @@
+ extern int cssyydebug;
+ #endif
+ 
+-extern int cssyyparse(void* parser);
++extern int cssyyparse(WebCore::CSSParser*);
+ 
+ using namespace std;
+ using namespace WTF;
+diff --git a/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y b/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
+index 2eba5b35bd2338272a0f4ec756d137e47d2d59c8..d558211db2d89ea13716762a51397755560f66f3 100644
+--- a/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
++++ b/third_party/WebKit/Source/WebCore/xml/XPathGrammar.y
+@@ -34,6 +34,7 @@
+ #include "XPathParser.h"
+ #include "XPathPath.h"
+ #include "XPathPredicate.h"
++#include "XPathStep.h"
+ #include "XPathVariableReference.h"
+ #include <wtf/FastMalloc.h>
+ 
+@@ -44,8 +45,6 @@
+ #define YYLTYPE_IS_TRIVIAL 1
+ #define YYDEBUG 0
+ #define YYMAXDEPTH 10000
+-#define YYPARSE_PARAM parserParameter
+-#define PARSER static_cast<Parser*>(parserParameter)
+ 
+ using namespace WebCore;
+ using namespace XPath;
+@@ -53,6 +52,7 @@ using namespace XPath;
+ %}
+ 
+ %pure_parser
++%parse-param { WebCore::XPath::Parser* parser }
+ 
+ %union
+ {
+@@ -71,7 +71,7 @@ using namespace XPath;
+ %{
+ 
+ static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
+-static void xpathyyerror(const char*) { }
++static void xpathyyerror(void*, const char*) { }
+     
+ %}
+ 
+@@ -118,7 +118,7 @@ static void xpathyyerror(const char*) { }
+ Expr:
+     OrExpr
+     {
+-        PARSER->m_topExpr = $1;
++        parser->m_topExpr = $1;
+     }
+     ;
+ 
+@@ -138,7 +138,7 @@ AbsoluteLocationPath:
+     '/'
+     {
+         $$ = new LocationPath;
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     |
+     '/' RelativeLocationPath
+@@ -150,7 +150,7 @@ AbsoluteLocationPath:
+     {
+         $$ = $2;
+         $$->insertFirstStep($1);
+-        PARSER->unregisterParseNode($1);
++        parser->unregisterParseNode($1);
+     }
+     ;
+ 
+@@ -159,22 +159,22 @@ RelativeLocationPath:
+     {
+         $$ = new LocationPath;
+         $$->appendStep($1);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->registerParseNode($$);
+     }
+     |
+     RelativeLocationPath '/' Step
+     {
+         $$->appendStep($3);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($3);
+     }
+     |
+     RelativeLocationPath DescendantOrSelf Step
+     {
+         $$->appendStep($2);
+         $$->appendStep($3);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($2);
++        parser->unregisterParseNode($3);
+     }
+     ;
+ 
+@@ -183,58 +183,58 @@ Step:
+     {
+         if ($2) {
+             $$ = new Step(Step::ChildAxis, *$1, *$2);
+-            PARSER->deletePredicateVector($2);
++            parser->deletePredicateVector($2);
+         } else
+             $$ = new Step(Step::ChildAxis, *$1);
+-        PARSER->deleteNodeTest($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteNodeTest($1);
++        parser->registerParseNode($$);
+     }
+     |
+     NAMETEST OptionalPredicateList
+     {
+         String localName;
+         String namespaceURI;
+-        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
+-            PARSER->m_gotNamespaceError = true;
++        if (!parser->expandQName(*$1, localName, namespaceURI)) {
++            parser->m_gotNamespaceError = true;
+             YYABORT;
+         }
+         
+         if ($2) {
+             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
+-            PARSER->deletePredicateVector($2);
++            parser->deletePredicateVector($2);
+         } else
+             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     AxisSpecifier NodeTest OptionalPredicateList
+     {
+         if ($3) {
+             $$ = new Step($1, *$2, *$3);
+-            PARSER->deletePredicateVector($3);
++            parser->deletePredicateVector($3);
+         } else
+             $$ = new Step($1, *$2);
+-        PARSER->deleteNodeTest($2);
+-        PARSER->registerParseNode($$);
++        parser->deleteNodeTest($2);
++        parser->registerParseNode($$);
+     }
+     |
+     AxisSpecifier NAMETEST OptionalPredicateList
+     {
+         String localName;
+         String namespaceURI;
+-        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
+-            PARSER->m_gotNamespaceError = true;
++        if (!parser->expandQName(*$2, localName, namespaceURI)) {
++            parser->m_gotNamespaceError = true;
+             YYABORT;
+         }
+ 
+         if ($3) {
+             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
+-            PARSER->deletePredicateVector($3);
++            parser->deletePredicateVector($3);
+         } else
+             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
+-        PARSER->deleteString($2);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($2);
++        parser->registerParseNode($$);
+     }
+     |
+     AbbreviatedStep
+@@ -259,23 +259,23 @@ NodeTest:
+         else if (*$1 == "comment")
+             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
+ 
+-        PARSER->deleteString($1);
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->registerNodeTest($$);
+     }
+     |
+     PI '(' ')'
+     {
+         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
+-        PARSER->deleteString($1);        
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->registerNodeTest($$);
+     }
+     |
+     PI '(' LITERAL ')'
+     {
+         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
+-        PARSER->deleteString($1);        
+-        PARSER->deleteString($3);
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->deleteString($3);
++        parser->registerNodeTest($$);
+     }
+     ;
+ 
+@@ -293,14 +293,14 @@ PredicateList:
+     {
+         $$ = new Vector<Predicate*>;
+         $$->append(new Predicate($1));
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerPredicateVector($$);
++        parser->unregisterParseNode($1);
++        parser->registerPredicateVector($$);
+     }
+     |
+     PredicateList Predicate
+     {
+         $$->append(new Predicate($2));
+-        PARSER->unregisterParseNode($2);
++        parser->unregisterParseNode($2);
+     }
+     ;
+ 
+@@ -315,7 +315,7 @@ DescendantOrSelf:
+     SLASHSLASH
+     {
+         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -323,13 +323,13 @@ AbbreviatedStep:
+     '.'
+     {
+         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     |
+     DOTDOT
+     {
+         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -337,8 +337,8 @@ PrimaryExpr:
+     VARIABLEREFERENCE
+     {
+         $$ = new VariableReference(*$1);
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     '(' Expr ')'
+@@ -349,15 +349,15 @@ PrimaryExpr:
+     LITERAL
+     {
+         $$ = new StringExpression(*$1);
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     NUMBER
+     {
+         $$ = new Number($1->toDouble());
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     FunctionCall
+@@ -369,8 +369,8 @@ FunctionCall:
+         $$ = createFunction(*$1);
+         if (!$$)
+             YYABORT;
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     FUNCTIONNAME '(' ArgumentList ')'
+@@ -378,9 +378,9 @@ FunctionCall:
+         $$ = createFunction(*$1, *$3);
+         if (!$$)
+             YYABORT;
+-        PARSER->deleteString($1);
+-        PARSER->deleteExpressionVector($3);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->deleteExpressionVector($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -389,14 +389,14 @@ ArgumentList:
+     {
+         $$ = new Vector<Expression*>;
+         $$->append($1);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerExpressionVector($$);
++        parser->unregisterParseNode($1);
++        parser->registerExpressionVector($$);
+     }
+     |
+     ArgumentList ',' Argument
+     {
+         $$->append($3);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($3);
+     }
+     ;
+ 
+@@ -412,9 +412,9 @@ UnionExpr:
+         $$ = new Union;
+         $$->addSubExpression($1);
+         $$->addSubExpression($3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -430,9 +430,9 @@ PathExpr:
+     {
+         $3->setAbsolute(true);
+         $$ = new Path(static_cast<Filter*>($1), $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     |
+     FilterExpr DescendantOrSelf RelativeLocationPath
+@@ -440,10 +440,10 @@ PathExpr:
+         $3->insertFirstStep($2);
+         $3->setAbsolute(true);
+         $$ = new Path(static_cast<Filter*>($1), $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($2);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -453,9 +453,9 @@ FilterExpr:
+     PrimaryExpr PredicateList
+     {
+         $$ = new Filter($1, *$2);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->deletePredicateVector($2);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->deletePredicateVector($2);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -465,9 +465,9 @@ OrExpr:
+     OrExpr OR AndExpr
+     {
+         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -477,9 +477,9 @@ AndExpr:
+     AndExpr AND EqualityExpr
+     {
+         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -489,9 +489,9 @@ EqualityExpr:
+     EqualityExpr EQOP RelationalExpr
+     {
+         $$ = new EqTestOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -501,9 +501,9 @@ RelationalExpr:
+     RelationalExpr RELOP AdditiveExpr
+     {
+         $$ = new EqTestOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -513,17 +513,17 @@ AdditiveExpr:
+     AdditiveExpr PLUS MultiplicativeExpr
+     {
+         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     |
+     AdditiveExpr MINUS MultiplicativeExpr
+     {
+         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -533,9 +533,9 @@ MultiplicativeExpr:
+     MultiplicativeExpr MULOP UnaryExpr
+     {
+         $$ = new NumericOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -546,8 +546,8 @@ UnaryExpr:
+     {
+         $$ = new Negative;
+         $$->addSubExpression($2);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($2);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+diff --git a/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp b/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
+index 62d8ee37fd6ebb74a580a00c59beb6cd40c5a8b7..b5e6a9237593b4aaa2a243f2ff9d86e57f930a97 100644
+--- a/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
++++ b/third_party/WebKit/Source/WebCore/xml/XPathParser.cpp
+@@ -32,24 +32,21 @@
+ #include "XPathEvaluator.h"
+ #include "XPathException.h"
+ #include "XPathNSResolver.h"
++#include "XPathPath.h"
+ #include "XPathStep.h"
+ #include <wtf/StdLibExtras.h>
+ #include <wtf/text/StringHash.h>
+ 
+-int xpathyyparse(void*);
+-
++using namespace WebCore;
+ using namespace WTF;
+ using namespace Unicode;
++using namespace XPath;
+ 
+-namespace WebCore {
+-namespace XPath {
+-
+-class LocationPath;
+-
+-#include "XPathGrammar.h"    
++extern int xpathyyparse(WebCore::XPath::Parser*);
++#include "XPathGrammar.h"
+ 
+ Parser* Parser::currentParser = 0;
+-    
++
+ enum XMLCat { NameStart, NameCont, NotPartOfName };
+ 
+ typedef HashMap<String, Step::Axis> AxisNamesMap;
+@@ -630,5 +627,3 @@ void Parser::deleteNodeTest(Step::NodeTest* t)
+     delete t;
+ }
+ 
+-}
+-}
diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
index e657c48..22b141c 100644
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 	file://unistd.patch \
 	file://memset.patch \
 	file://softfloat-fix.patch \
+	file://bison-2.6.patch \
 "
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
@@ -15,7 +16,7 @@ COMPATIBLE_MACHINE = "(-)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "0cdd94b2be21180af93f719e9a9a2883"
 SRC_URI[sha256sum] = "3bdce0bd8381cd699014e7ec72ab02c7d8444ba511c27afff76bf015361c4021"
-- 
1.7.9.5



